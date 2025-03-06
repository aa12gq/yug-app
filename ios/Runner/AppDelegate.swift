import Flutter
import UIKit
import CloudPushSDK
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate {
  private let CHANNEL_NAME = "com.vtyug.ygApp/push"
  private var channel: FlutterMethodChannel?
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    if let controller = window?.rootViewController as? FlutterViewController {
      channel = FlutterMethodChannel(name: CHANNEL_NAME, binaryMessenger: controller.binaryMessenger)
    }
    
    initCloudPush()
    registerAPNs(application)
    registerMessageReceive()
    CloudPushSDK.sendNotificationAck(launchOptions)
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  // MARK: - 推送SDK初始化
  @objc func initCloudPush() {
    CloudPushSDK.asyncInit("335440742", appSecret: "6149e6c2bc784869865a2ff25e10f9ea") { [weak self] (result: CloudPushCallbackResult?) in
      guard let res = result else {
        print("SDK初始化回调结果为nil")
        return
      }
      if res.success {
        print("Push SDK init success, deviceId: \(CloudPushSDK.getDeviceId() ?? "")")
      } else {
        print("Push SDK init failed, error: \(res.error?.localizedDescription ?? "unknown error")")
      }
    }
  }
  
  // MARK: - 注册APNs
  func registerAPNs(_ application: UIApplication) {
    print("开始注册 APNs...")
    if #available(iOS 10.0, *) {
      let center = UNUserNotificationCenter.current()
      center.delegate = self
      center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
        print("请求通知权限结果: granted=\(granted), error=\(String(describing: error))")
        if granted {
          DispatchQueue.main.async {
            print("用户允许通知权限，开始注册远程通知...")
            application.registerForRemoteNotifications()
          }
        }
      }
    } else {
      let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
      application.registerUserNotificationSettings(settings)
      application.registerForRemoteNotifications()
    }
  }
  
  // MARK: - 注册消息接收监听
  func registerMessageReceive() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(onMessageReceived(_:)),
      name: NSNotification.Name("CCPDidReceiveMessageNotification"),
      object: nil
    )
  }
  
  // MARK: - 处理推送消息
  @objc func onMessageReceived(_ notification: Notification) {
    guard let message = notification.object as? CCPSysMessage else { return }
    
    if let title = String(data: message.title, encoding: .utf8),
       let body = String(data: message.body, encoding: .utf8) {
      print("Receive message title: \(title), content: \(body)")
      
      // 显示本地通知
      if #available(iOS 10.0, *) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                          content: content,
                                          trigger: nil)
        
        UNUserNotificationCenter.current().add(request)
      }
      
      // 确保在主线程调用 Flutter channel
      DispatchQueue.main.async { [weak self] in
        let messageData: [String: Any] = [
          "title": title,
          "body": body,
          "type": "message"
        ]
        self?.channel?.invokeMethod("onMessage", arguments: messageData)
      }
    }
  }
  
  // MARK: - APNs注册成功回调
  override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
    let token = tokenParts.joined()
    print("收到 APNs deviceToken: \(token)")
    
    CloudPushSDK.registerDevice(deviceToken) { [weak self] (result: CloudPushCallbackResult?) in
      guard let res = result else {
        print("注册deviceToken回调结果为nil")
        return
      }
      if res.success {
        print("注册 deviceToken 到阿里云成功，deviceId: \(CloudPushSDK.getDeviceId() ?? "unknown")")
      } else {
        print("注册 deviceToken 到阿里云失败，错误: \(res.error?.localizedDescription ?? "unknown error")")
      }
    }
  }
  
  // MARK: - APNs注册失败回调
  override func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    print("注册远程通知失败，错误: \(error.localizedDescription)")
  }
  
  // MARK: - 统一处理静默推送
  override func application(_ application: UIApplication,
                          didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                          fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    super.application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
    handleRemoteNotification(userInfo)
    CloudPushSDK.sendNotificationAck(userInfo)
    completionHandler(.newData)
  }
  
  // MARK: - 统一处理通知
  private func handleRemoteNotification(_ userInfo: [AnyHashable: Any]) {
    guard let aps = userInfo["aps"] as? [String: Any] else { return }
    
    // 解析通用字段
    let content = (aps["alert"] as? String) ?? (aps["alert"] as? [String: String])?["body"] ?? ""
    let badge = aps["badge"] as? Int ?? 0
    let sound = aps["sound"] as? String ?? ""
    let extras = userInfo["Extras"] as? String ?? ""
    
    print("content = [\(content)], badge = [\(badge)], sound = [\(sound)], Extras = [\(extras)]")
    
    // 上报阿里云
    CloudPushSDK.sendNotificationAck(userInfo)
    
    // 确保在主线程调用 Flutter channel
    DispatchQueue.main.async { [weak self] in
      // 透传数据到Flutter
      let payload: [String: Any] = [
        "content": content,
        "badge": badge,
        "sound": sound,
        "extras": extras,
        "rawData": userInfo
      ]
      self?.channel?.invokeMethod("onNotification", arguments: payload)
    }
  }
}

// MARK: - iOS 10+ 通知代理
@available(iOS 10.0, *)
extension AppDelegate {
  override func userNotificationCenter(_ center: UNUserNotificationCenter,
                                     willPresent notification: UNNotification,
                                     withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    super.userNotificationCenter(center, willPresent: notification, withCompletionHandler: completionHandler)
    if #available(iOS 14.0, *) {
      completionHandler([.banner, .sound, .badge])
    } else {
      completionHandler([.alert, .sound, .badge])
    }
  }
  
  override func userNotificationCenter(_ center: UNUserNotificationCenter,
                                     didReceive response: UNNotificationResponse,
                                     withCompletionHandler completionHandler: @escaping () -> Void) {
    super.userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
    handleRemoteNotification(response.notification.request.content.userInfo)
    completionHandler()
  }
}


import "dart:developer";
import "dart:io";

import "package:flutter/foundation.dart";
import "package:yug_app/plugins/aliyun_push.dart" as ali;
import "package:yug_app/common/utils/device_utils.dart";
import "package:yug_app/common/utils/log.dart";

enum ServiceProvider {
  jpush,
  aliyun,
  unknown,
}

const unknownDeviceId = "UNKNOWN_DEVICE_ID";

class PushRegistration {
  final String deviceId;
  final ServiceProvider? serviceProvider;

  const PushRegistration(this.deviceId, this.serviceProvider);
}

Future<PushRegistration> getPushRegistrationID(
    [ServiceProvider? sp = ServiceProvider.aliyun]) async {
  if (!Platform.isIOS && !Platform.isAndroid) {
    return const PushRegistration(unknownDeviceId, ServiceProvider.unknown);
  }
  var regId = unknownDeviceId;
  if (sp == ServiceProvider.aliyun) {
    if (!ali.initialized) {
      logMessage("阿里云推送尚未初始化");
      await ali.initAliyunPush();
    }
    if (ali.initialized) {
      regId = await ali.aliyunPush
          .getDeviceId()
          .timeout(const Duration(milliseconds: 5000), onTimeout: () {
        logMessage("推送 ID 获取超时");
        return unknownDeviceId;
      }).onError((e, s) {
        logMessage(e);
        logMessage(s);
        return unknownDeviceId;
      });
      logDebug("获取到推送 ID: $regId");
    }
  } else {
    throw UnimplementedError("目前只支持阿里云推送");
  }
  if (kDebugMode && regId == unknownDeviceId) {
    logDebug("推送 ID 获取失败, 使用伪设备ID代替");
    regId = await Device.guuid;
  }
  if (regId == unknownDeviceId) {
    sp = ServiceProvider.unknown;
  }
  return PushRegistration(regId, sp);
}

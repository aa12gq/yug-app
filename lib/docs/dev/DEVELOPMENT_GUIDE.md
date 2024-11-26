# 开发指南

## 示例代码

```dart
// 1. 创建客户端
final client = await GrpcClientUtil.createClient(UserFrontendClient.new);

// 2. 调用接口
try {
    final response = await client.getUserInfo(
        GetUserInfoRequest(userId: Int64(1))
    );
    print("调用成功: $response");
} catch (e) {
    print("调用失败: $e");
}
```

## 错误处理说明

在调用 gRPC 接口时，建议使用 `try-catch` 结构来捕获和处理可能的异常。

## 开发规范

- 遵循 SOLID 原则
- 使用设计模式解决常见问题

## 调试工具推荐

- Flutter DevTools
- gRPCurl

## 常见问题解答

- **如何解决依赖冲突？** 请确保 `pubspec.yaml` 中的依赖版本与项目需求一致。
- **如何调试 gRPC 请求？** 使用 gRPCurl 工具来测试和调试 gRPC 服务。

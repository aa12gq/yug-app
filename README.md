# YUG App

基于 Flutter 和 gRPC 的移动应用开发框架。

## 项目简介

YUG App 是一个使用 Flutter 和 gRPC 技术栈构建的移动应用开发框架，旨在提供高效的网络通信、优雅的用户界面及高质量的开发体验。

## 快速开始

### 环境准备

1. **安装 protoc 编译器**

   - MacOS: 执行命令 `brew install protobuf`
   - Linux: 执行命令 `apt-get install protobuf-compiler`

2. **安装 Dart protoc 插件**

   执行命令 `dart pub global activate protoc_plugin`

3. **安装 Flutter 依赖**

   执行命令 `flutter pub get`

### 编译 proto 文件

在项目根目录下执行以下命令：

```bash
protoc --dart_out=grpc:lib/common/net/grpcs/proto \
  --proto_path=protos \
  protos/*.proto
```

## 目录结构说明

```
lib/
├── common/       # 公共代码
│   ├── net/      # 网络相关
│   │   └── grpcs/ # gRPC 实现
│   ├── i18n/     # 国际化
│   └── values/   # 常量定义
└── pages/        # 页面代码
```

## 开发指南

### 示例代码

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

## 参考文档链接

- [Flutter 官方文档](https://flutter.dev/docs)
- [gRPC 官方文档](https://grpc.io/docs/)

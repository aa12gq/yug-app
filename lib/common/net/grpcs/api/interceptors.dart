import 'package:grpc/grpc.dart';
import 'package:protobuf/protobuf.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:yug_app/common/i18n/index.dart';
import 'package:yug_app/common/net/grpcs/api/delegating_response_future.dart';
import 'package:yug_app/common/services/token_refresh_service.dart';
import 'package:yug_app/common/services/user.dart';

typedef GrpcErrorCreator = GrpcError Function(
    [String? message, List<GeneratedMessage>? details, Object? rawResponser]);

/// 对部分(错误响应)消息进行本地化处理.
class ResponseL10n implements ClientInterceptor {
  @override
  ResponseStream<R> interceptStreaming<Q, R>(
      ClientMethod<Q, R> method,
      Stream<Q> requests,
      CallOptions options,
      ClientStreamingInvoker<Q, R> invoker) {
    return invoker(method, requests, options);
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    final r = invoker(method, request, options);
    return DelegatingResponseFuture(r).catchError((e) {
      if (e is GrpcError) {
        String? msg;
        GrpcErrorCreator? ec;
        switch (e.code) {
          case StatusCode.deadlineExceeded:
            msg = LocaleKeys.networkErrorTimeout.tr;
            ec = GrpcError.deadlineExceeded;
            break;
          case StatusCode.aborted:
            msg = LocaleKeys.networkErrorAborted.tr;
            ec = GrpcError.aborted;
            break;
          case StatusCode.cancelled:
            ec = GrpcError.cancelled;
            msg = LocaleKeys.networkErrorCancelled.tr;
            break;
          case StatusCode.unknown:
            ec = GrpcError.unknown;
            msg = LocaleKeys.networkErrorUnknown.tr;
            break;
          case StatusCode.internal:
            ec = GrpcError.internal;
            if (e.message == null || e.message!.startsWith("unknown")) {
              msg = LocaleKeys.networkErrorInternal.tr;
            }
            break;
        }
        if (msg != null) {
          throw ec!(msg, e.details, e.rawResponse);
        }
      }
      throw e;
    });
  }
}

/// Token 刷新拦截器
class TokenRefreshInterceptor extends ClientInterceptor {
  static const _tag = "TokenRefreshInterceptor";
  static const _unauthenticatedCode = 16; // gRPC UNAUTHENTICATED 状态码

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    final call = invoker(method, request, options);
    return DelegatingResponseFuture(call).catchError((error) async {
      if (error is GrpcError && error.code == _unauthenticatedCode) {
        print('[$_tag] 检测到401错误，尝试刷新token');

        final refreshed = await TokenRefreshService.to.refreshToken();
        if (refreshed) {
          print('[$_tag] token刷新成功，重试请求');
          final newOptions = options.mergedWith(
            CallOptions(metadata: {
              'yug-x-authorization': UserService.to.token,
            }),
          );
          return invoker(method, request, newOptions);
        }
      }
      throw error;
    });
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    // 流式请求暂不处理token刷新
    return invoker(method, requests, options);
  }
}

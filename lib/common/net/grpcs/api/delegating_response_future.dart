import 'dart:async';
import 'package:async/async.dart';
import 'package:grpc/grpc.dart';

/// 代理响应future
class DelegatingResponseFuture<R> extends DelegatingFuture<R>
    implements ResponseFuture<R> {
  Response responseDelegate;

  DelegatingResponseFuture.split(
      this.responseDelegate, Future<R> futureDelegate)
      : super(futureDelegate);

  DelegatingResponseFuture(ResponseFuture<R> delegate)
      : this.split(delegate, delegate);

  @override
  ResponseStream<R> asStream() =>
      DelegatingResponseStream.split(responseDelegate, super.asStream());

  @override
  ResponseFuture<R> catchError(Function onError,
      {bool Function(Object error)? test}) =>
      DelegatingResponseFuture.split(
          responseDelegate, super.catchError(onError, test: test));

  @override
  ResponseFuture<S> then<S>(FutureOr<S> Function(R) onValue,
      {Function? onError}) =>
      DelegatingResponseFuture.split(
          responseDelegate, super.then(onValue, onError: onError));

  @override
  ResponseFuture<R> whenComplete(FutureOr Function() action) =>
      DelegatingResponseFuture.split(
          responseDelegate, super.whenComplete(action));

  @override
  ResponseFuture<R> timeout(Duration timeLimit,
      {FutureOr<R> Function()? onTimeout}) =>
      DelegatingResponseFuture.split(
          responseDelegate, super.timeout(timeLimit, onTimeout: onTimeout));

  @override
  Future<void> cancel() {
    return responseDelegate.cancel();
  }

  @override
  Future<Map<String, String>> get headers => responseDelegate.headers;

  @override
  Future<Map<String, String>> get trailers => responseDelegate.trailers;
}

class DelegatingResponseStream<R> extends DelegatingStream<R>
    implements ResponseStream<R> {
  Response responseDelegate;

  DelegatingResponseStream.split(
      this.responseDelegate, Stream<R> streamDelegate)
      : super(streamDelegate);

  DelegatingResponseStream(ResponseStream<R> delegate)
      : this.split(delegate, delegate);

  @override
  ResponseFuture<R> get single =>
      DelegatingResponseFuture.split(responseDelegate, super.single);

  @override
  ResponseStream<R> handleError(Function onError,
      {bool Function(dynamic error)? test}) {
    return DelegatingResponseStream.split(
        responseDelegate, super.handleError(onError, test: test));
  }

  @override
  Future<void> cancel() async {
    await responseDelegate.cancel();
  }

  @override
  Future<Map<String, String>> get headers => responseDelegate.headers;

  @override
  Future<Map<String, String>> get trailers => responseDelegate.trailers;
}
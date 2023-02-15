import 'package:dio/dio.dart';
import 'package:dio/io.dart';

const String keyAccept = 'Accept';
const String keyAuth = 'Authorization';

class DioHttpClient extends DioForNative {
  DioHttpClient(
    String baseUrl, {
    BaseOptions? options,
  }) : super(options) {
    interceptors.add(InterceptorsWrapper(onRequest: _requestInterceptor));
    this.options.baseUrl = baseUrl;
  }

  void _requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[keyAccept] = 'application/json; charset=utf-8';
    options.connectTimeout = const Duration(milliseconds: 2000);
    options.receiveTimeout = const Duration(milliseconds: 2000);
    handler.next(options);
  }
}

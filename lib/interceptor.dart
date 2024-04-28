import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final sb = StringBuffer();
    sb.writeln('--> ${options.method.toUpperCase()} ${options.uri}');

    if (options.headers.isNotEmpty) {
      sb.writeln('Headers:');
      options.headers.forEach((k, v) => sb.writeln('  $k: $v'));
    }

    if (options.queryParameters.isNotEmpty) {
      sb.writeln('Query Parameters:');
      options.queryParameters.forEach((k, v) => sb.writeln('  $k: $v'));
    }

    if (options.data != null) {
      sb.writeln('Body: ${options.data}');
    }

    sb.writeln('--> END ${options.method.toUpperCase()}');

    logger.i(sb.toString());

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final sb = StringBuffer();
    sb.writeln('<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri}');

    sb.writeln('Headers: ${response.headers.map}');
    sb.writeln('Response: ${response.data}');

    sb.writeln('<-- END HTTP');

    logger.i(sb.toString());

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final sb = StringBuffer();
    sb.writeln('--> ERROR ${err.requestOptions.method} ${err.requestOptions.uri}');

    if (err.response != null) {
      sb.writeln('Status code: ${err.response!.statusCode}');
      sb.writeln('Data: ${err.response!.data}');
      sb.writeln('Headers: ${err.response!.headers}');
    } else {
      sb.writeln('Error: ${err.message}');
    }

    sb.writeln('<-- END ERROR');

    logger.e(sb.toString());

    super.onError(err, handler);
  }
}

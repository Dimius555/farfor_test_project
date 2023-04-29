import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:farfor_test_project/data/constants.dart';

/// Провайдер Dio с настройками.
class DioProvider {
  Dio get() {
    BaseOptions options =
        BaseOptions(receiveDataWhenStatusError: true, connectTimeout: const Duration(seconds: 30), receiveTimeout: const Duration(seconds: 60));

    final dio = Dio(options);

    dio.options.baseUrl = '';

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.baseUrl = AppConstants.baseURL;
        log('🚀🚀🚀---------------------------------🚀🚀🚀');
        log('| REQUEST SENT:');
        log('|    🟡 FULL URL: ${options.uri.toString()}');
        log('|    🟡 PARAMETERS: ${options.data.toString()}');
        log('|    🟡 PATH/QUERY: ${options.path.toString()}');
        log('|    🟡 HEADERS: ${options.headers.toString()}');
        log('🚀🚀🚀---------------------------------🚀🚀🚀');
        log('\n');
        handler.next(options);
      },
      onResponse: (e, handler) {
        log('-----------------✅✅✅✅✅-----------------');
        log('| RESPONSE RECIEVED:');
        log('|    🟢 REQUEST: ${e.realUri.toString()}');
        log('|    🟢 DATA: ${e.data.toString()}');
        log('-----------------✅✅✅✅✅-----------------');
        log('\n');
        if (e.data is String) {
          final response = Response(requestOptions: e.requestOptions, data: json.decode(e.data));
          handler.next(response);
        } else {
          handler.next(e);
        }
      },
    ));

    return dio;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

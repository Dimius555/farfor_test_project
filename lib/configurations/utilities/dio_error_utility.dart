import 'package:dio/dio.dart';

class DioErrorUtil {
  static String handleError(dynamic error) {
    String errorDescription = '';

    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          errorDescription = 'Запрос был отменен';
          break;
        case DioErrorType.connectionTimeout:
          errorDescription = 'Время подключения истекло';
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = 'Время ожидания ответа истекло';
          break;
        case DioErrorType.sendTimeout:
          errorDescription = 'Время ожидания отправки истекло';
          break;
        case DioErrorType.badResponse:
          switch (error.response?.statusCode) {
            case 400:
              errorDescription = 'Неверный запрос';
              break;
            case 401:
              errorDescription = 'Не авторизован';
              break;
            case 403:
              errorDescription = 'Доступ запрещен';
              break;
            case 404:
              errorDescription = 'Не найдено';
              break;
            case 500:
              errorDescription = 'Внутренняя ошибка сервера';
              break;
            case 503:
              errorDescription = 'Сервис недоступен';
              break;
            default:
              errorDescription = 'Неизвестная ошибка';
          }
          break;
        case DioErrorType.unknown:
          errorDescription = 'Сетевая ошибка';
          break;
        case DioErrorType.badCertificate:
          errorDescription = 'Сетевая ошибка';
          break;
        case DioErrorType.connectionError:
          errorDescription = 'Проблема с соединением';
          break;
      }
    } else {
      errorDescription = 'Неизвестная ошибка';
    }

    return errorDescription;
  }
}

import 'package:dio/dio.dart';
import 'package:google_map/core/error/exceptions.dart';
import 'package:google_map/core/helpers/api_helper/api_consumer.dart';
import 'package:google_map/core/helpers/api_helper/status_code.dart';

class DioConsumer implements ApiConsumer {
  DioConsumer(this._dio) {
    _dio.options
      ..responseType = ResponseType.json
      ..sendTimeout = const Duration(seconds: 10)
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 20);
  }

  final Dio _dio;

  @override
  Future<dynamic> get(
      {required String url,
      Map<String, dynamic>? param,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(url,
          queryParameters: param, options: Options(headers: headers));
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<dynamic> post({
    required String url,
    Map<String, dynamic>? param,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(url,
          queryParameters: param,
          data: body,
          options: Options(headers: headers));
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  void _handleDioError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.badResponse:
        switch (exception.response!.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.confilct:
            throw const ConflictException();

          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionError:
        throw const NoInternetConnectionException();
      case DioExceptionType.unknown:
        throw const UnKnownException();
    }
  }
}

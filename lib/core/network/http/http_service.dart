import 'package:dio/dio.dart';
import 'package:movies_app/core/network/error_handler/network_exceptions.dart';

class HttpService {
  final String baseUrl;

  late final Dio client = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
      responseType: ResponseType.json,
    ),
  );

  HttpService(this.baseUrl);

  Future<T> getRequest<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic) expectedResponseModel,
    bool? withToken = false,
  }) async {
    try {
      final response = await client.get(
        path,
        queryParameters: queryParameters,
        options: Options(extra: {'withToken': withToken}),
      );
      return expectedResponseModel(response.data);
    } catch (error) {
      final errorMessage = NetworkExceptions.getDioException(error);
      throw errorMessage;
    }
  }

  Future<T> postRequest<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    required T Function(dynamic) expectedResponseModel,
    bool? withToken = false,
  }) async {
    try {
      final response = await client.post(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(extra: {'withToken': withToken}),
      );
      return expectedResponseModel(response.data);
    } catch (error) {
      final errorMessage = NetworkExceptions.getDioException(error);
      throw errorMessage;
    }
  }

  Future<T> putRequest<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    required T Function(dynamic) expectedResponseModel,
    bool? withToken = false,
  }) async {
    try {
      final response = await client.put(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(extra: {'withToken': withToken}),
      );
      return expectedResponseModel(response.data);
    } catch (error) {
      final errorMessage = NetworkExceptions.getDioException(error);
      throw errorMessage;
    }
  }

  Future<T> deleteRequest<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic) expectedResponseModel,
    bool? withToken = false,
  }) async {
    try {
      final response = await client.delete(
        path,
        queryParameters: queryParameters,
        options: Options(extra: {'withToken': withToken}),
      );
      return expectedResponseModel(response.data);
    } catch (error) {
      final errorMessage = NetworkExceptions.getDioException(error);
      throw errorMessage;
    }
  }
}

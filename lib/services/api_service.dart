import 'dart:io';
import 'package:arion_code_challenge/utilities/failures/failures.dart';
import 'package:arion_code_challenge/utilities/shared/locator.dart';
import 'package:dio/dio.dart';

typedef ApiCallFunction<T> = Future<Response<T>> Function();

class ApiService {
  ApiService({Dio? client}) : _client = client ?? locator();

  final Dio _client;

  Future get({
    required String path,
  }) async {
    return _unwrapError(
      () => _client.get(
        path,
      ),
    );
  }

  Future _unwrapError(
    ApiCallFunction<dynamic> apiCall,
  ) async {
    try {
      final value = await apiCall();
      return value.data;
    } on SocketException {
      throw const NoInternetFailure();
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.other) {
        throw dioError.error;
      } else {
        rethrow;
      }
    }
  }
}

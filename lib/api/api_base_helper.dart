// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'api_response.dart';
import 'api_exceptions.dart';

var dio = Dio(
  BaseOptions(
    connectTimeout: const Duration(seconds: 30), // Connection timeout
    receiveTimeout: const Duration(seconds: 30), // Receiving timeout
  ),
);

class ApiBaseHelper {
  Future<ApiResponse<dynamic>> _request(
    String method,
    String url,
    Map<String, dynamic>? headers, {
    dynamic body,
  }) async {
    try {
      Map<String, dynamic> headersDefauld = {
        // "Content-Type": "application/json",
        // "Trusted": dotenv.env['TRUSTED_KEY'],
        // "Authorization": "Bearer ${ApiConfig.token}"
      };
      final response = await dio.request(
        url,
        options: Options(
          method: method,
          headers: headers ?? headersDefauld,
          receiveTimeout: const Duration(seconds: 20),
          sendTimeout: const Duration(seconds: 20),
          followRedirects: true,
          validateStatus: (status) => status! < 500,
        ),
        data: body,
      );
      return ApiResponse.completed(_returnResponse(response));
    } on DioException catch (exception) {
      debugPrint('exception.$method: ${exception.toString()}');
      return ApiResponse.error(exception.message);
    }
  }

  Future<ApiResponse<dynamic>> get(String url) => _request('GET', url, {
        // "Content-Type": "application/json",
        // "Trusted": dotenv.env['TRUSTED_KEY'],
        // "Authorization": "Bearer ${ApiConfig.token}"
      });

  Future<ApiResponse<dynamic>> post(String url, dynamic body) => _request('POST', url, {}, body: body);

  Future<ApiResponse<dynamic>> put(String url, dynamic body) => _request('PUT', url, {}, body: body);

  Future<ApiResponse<dynamic>> patch(String url, dynamic body) => _request('PATCH', url, {}, body: body);

  Future<ApiResponse<dynamic>> delete(String url) => _request('DELETE', url, {});

  Future<ApiResponse<dynamic>> deletePack(String url, dynamic body) => _request('DELETE', url, {}, body: body);
}

dynamic _returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response.data;
    case 400:
      throw BadRequestException(response.data.toString());
    case 401:
      throw UnauthorisedException(response.data.toString());
    case 403:
      throw UnauthorisedException(response.data.toString());
    case 500:
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode: ${response.statusCode}');
    default:
      throw FetchDataException('Error occurred with StatusCode: ${response.statusCode}');
  }
}

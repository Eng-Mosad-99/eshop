import 'package:dio/dio.dart';
import 'package:eshop/core/networking/dio_exception_type_extension.dart';
import 'package:flutter/material.dart';
import 'api_error_factory.dart';
import 'api_error_model.dart';
import 'local_status_codes.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic e) {
    if (e is Exception) {
      if (e is DioException) {
        return e.when(
            connectionError: () => ApiErrorModel(
                  errors: [],
                  message:
                      "No internet connection. Please check your Wi-Fi or mobile data.",
                  icon: Icons.wifi_off,
                  statusCode: LocalStatusCodes.connectionError,
                ),
            connectionTimeout: () => ApiErrorModel(
                  errors: [],
                  message:
                      "The connection took too long. Try checking your internet or try again later.",
                  icon: Icons.timer_off,
                  statusCode: LocalStatusCodes.connectionTimeout,
                ),
            sendTimeout: () => ApiErrorModel(
                  errors: [],
                  message:
                      "Request timed out while sending data. Please try again.",
                  icon: Icons.send,
                  statusCode: LocalStatusCodes.sendTimeout,
                ),
            receiveTimeout: () => ApiErrorModel(
                  errors: [],
                  message:
                      "Server took too long to respond. Please try again later.",
                  icon: Icons.downloading,
                  statusCode: LocalStatusCodes.receiveTimeout,
                ),
            badCertificate: () => ApiErrorModel(
                  errors: [],
                  message:
                      "Security issue detected with the server. Connection not secure.",
                  icon: Icons.security,
                  statusCode: LocalStatusCodes.badCertificate,
                ),
            badResponse: () {
              final allErrors =
                  e.response?.data["errors"] as Map<String, dynamic>?;
              final errorsList = <String>[];
              if (allErrors != null) {
                allErrors.forEach((key, value) {
                  for (var e in (value as List)) {
                    final String singleErrMsg = "$key: $e";
                    errorsList.add(singleErrMsg);
                  }
                });
              }
              return ApiErrorModel(
                statusCode: e.response?.statusCode,
                message: e.response?.data["message"],
                errors: errorsList,
                icon: Icons.error,
              );
            },
            cancel: () => ApiErrorModel(
                  errors: [],
                  message: "The request was cancelled. Please try again.",
                  icon: Icons.cancel,
                  statusCode: LocalStatusCodes.cancel,
                ),
            unknown: () => ApiErrorModel(
                  errors: [],
                  message:
                      "Something went wrong. Please check your connection and try again.",
                  icon: Icons.error_outline,
                  statusCode: LocalStatusCodes.unknown,
                ));
      } else {
        return ApiErrorFactory.defaultError;
      }
    }
    return ApiErrorFactory.defaultError;
  }
}

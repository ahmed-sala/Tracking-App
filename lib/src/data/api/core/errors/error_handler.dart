import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/statues_codes.dart';

class ErrorHandler {
  final String errorMessage;
  final int? code;

  ErrorHandler({required this.errorMessage, this.code});

  static ErrorHandler fromException(
      Exception exception, AppLocalizations locale) {
    if (exception is DioException) {
      return _handleDioException(exception, locale);
    } else if (exception is FirebaseException) {
      return _handleFirestoreException(exception, locale);
    } else {
      return ErrorHandler(errorMessage: locale.unknown);
    }
  }

  static ErrorHandler _handleDioException(
      DioException exception, AppLocalizations locale) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ErrorHandler(errorMessage: locale.connectionError);
      case DioExceptionType.badCertificate:
        return ErrorHandler(errorMessage: locale.badCertificate);
      case DioExceptionType.badResponse:
        return ErrorHandler._fromResponse(exception.response!, locale);
      case DioExceptionType.connectionError:
        return ErrorHandler(errorMessage: locale.connectionError);
      default:
        return ErrorHandler(errorMessage: locale.unknown);
    }
  }

  static ErrorHandler _handleFirestoreException(
      FirebaseException exception, AppLocalizations locale) {
    switch (exception.code) {
      case 'permission-denied':
        return ErrorHandler(errorMessage: locale.permissionDenied);
      case 'not-found':
        return ErrorHandler(errorMessage: locale.notFount);
      case 'unavailable':
        return ErrorHandler(errorMessage: locale.serviceUnavailable);
      case 'already-exists':
        return ErrorHandler(errorMessage: locale.alreadyExists);
      case 'deadline-exceeded':
        return ErrorHandler(errorMessage: locale.requestTimeout);
      case 'cancelled':
        return ErrorHandler(errorMessage: locale.requestCancelled);
      default:
        return ErrorHandler(errorMessage: locale.unknown);
    }
  }

  static ErrorHandler _fromResponse(
      Response<dynamic> response, AppLocalizations locale) {
    switch (response.statusCode) {
      case StatuesCodes.unauthorized:
      case StatuesCodes.forbidden:
        return ErrorHandler(errorMessage: response.data["error"], code: 401);
      case StatuesCodes.conflict:
        return ErrorHandler(
            errorMessage: response.data["error"] ?? locale.conflict, code: 409);
      case StatuesCodes.notFount:
        return ErrorHandler(errorMessage: locale.notFount);
      case StatuesCodes.internalServerError:
        return ErrorHandler(errorMessage: locale.internalServerError);
      default:
        return ErrorHandler(errorMessage: locale.unknown);
    }
  }
}

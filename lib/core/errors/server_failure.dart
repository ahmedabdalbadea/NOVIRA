import 'package:dio/dio.dart';
import 'package:novira_app/core/errors/failure.dart';

class ServerFailure extends Failure {
  ServerFailure(super.errMsg);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection Timeout With Server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send Timeout With Server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive Timeout With Server");
      case DioExceptionType.badCertificate:
        return ServerFailure("Incorrect Certificate With Server");
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          dioException.response!.data,
          dioException.response!.statusCode!,
        );
      case DioExceptionType.cancel:
        return ServerFailure("Your Request is Canceled With Server");
      case DioExceptionType.connectionError:
        return ServerFailure("No Internet Connection");
      case DioExceptionType.unknown:
        return ServerFailure("Oops, There was Error, Please Try again!");
      default:
        return ServerFailure("Oops, There was Error, Please Try again!");
    }
  }

  factory ServerFailure.fromBadResponse(dynamic response, int statusCode) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure("Authentication Error or Bad Request");
    } else if (statusCode == 404) {
      return ServerFailure("Your Request is Not Found, Please try later");
    } else if (statusCode == 500) {
      return ServerFailure("Server Internal Error, Please try later");
    } else {
      return ServerFailure("Oops, There was Error, Please Try again!");
    }
  }
}

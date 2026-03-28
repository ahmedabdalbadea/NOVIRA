import 'package:dio/dio.dart';
import 'package:novira_app/core/errors/failure.dart';
import 'package:novira_app/generated/l10n.dart';

class ServerFailure extends Failure {
  ServerFailure(super.errMsg);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(S.current.connection_timeout);
      case DioExceptionType.sendTimeout:
        return ServerFailure(S.current.send_timeout);
      case DioExceptionType.receiveTimeout:
        return ServerFailure(S.current.receive_timeout);
      case DioExceptionType.badCertificate:
        return ServerFailure(S.current.bad_certificate);
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          dioException.response!.data,
          dioException.response!.statusCode!,
        );
      case DioExceptionType.cancel:
        return ServerFailure(S.current.cancel_error);
      case DioExceptionType.connectionError:
        return ServerFailure(S.current.no_internet);
      case DioExceptionType.unknown:
        return ServerFailure(S.current.unknown_error);
      default:
        return ServerFailure(S.current.unknown_error);
    }
  }

  factory ServerFailure.fromBadResponse(dynamic response, int statusCode) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        "Authentication Error or Bad Request",
      ); // don't add local
    } else if (statusCode == 404) {
      return ServerFailure(S.current.not_found);
    } else if (statusCode == 500) {
      return ServerFailure(S.current.server_error);
    } else {
      return ServerFailure(S.current.unknown_error);
    }
  }
}

import 'package:dio/dio.dart';

String handleDioError(DioException error) {
    if(error.type == DioExceptionType.connectionTimeout) {
        return 'Connection timeout';
    } else if (error.type == DioExceptionType.receiveTimeout) {
        return 'Receive timeout';
    } else if (error.type == DioExceptionType.sendTimeout) {
        return 'Send timeout';
    } else if (error.type == DioExceptionType.badResponse) {
        if (error.response?.statusCode == 404) {
            return 'Resource not found';
        } else if(error.response?.statusCode == 401) {
            return 'Unauthorized access';
        } else if (error.response?.statusCode == 403) {
            return 'Forbidden access';
        } else if (error.response?.statusCode == 400) {
            return 'Bad request';
        } else if (error.response?.statusCode == 500) {
            return 'Internal server error';
        } else {
            return 'Received invalid status code: ${error.response?.statusCode}';
        }
    } else if (error.type == DioExceptionType.connectionError) {
        return 'Connection error';
    } else if (error.type == DioExceptionType.cancel) {
        return 'Request cancelled';
    } else {
        return 'Unexpected error: ${error.message}';
    }
}
import 'package:dio/dio.dart';
import '../models/creator_model.dart';

class CreatorRemoteDataSource {
  final Dio dio;

  CreatorRemoteDataSource(this.dio);

  Future<List<CreatorModel>> fetchCreators() async {
    try {
      final response = await dio.get("creators");

      switch (response.statusCode) {
        case 200:
          final List data = response.data;
          return data.map((e) => CreatorModel.fromJson(e)).toList();

        case 204:
          // No content but valid
          return [];

        case 400:
          throw Exception("Bad Request");

        case 401:
          throw Exception("Unauthorized access");

        case 403:
          throw Exception("Forbidden");

        case 404:
          throw Exception("Creators not found");

        case 500:
          throw Exception("Server error");

        default:
          throw Exception("Unknown error: ${response.statusCode}");
      }
    } on DioException catch (e) {
      // Network or timeout errors
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception("Connection timeout");
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Receive timeout");
      }
      if (e.type == DioExceptionType.badResponse) {
        throw Exception(
            "Bad response: ${e.response?.statusCode} - ${e.response?.data}");
      }

      throw Exception("Unexpected error: ${e.message}");
    }
  }
}

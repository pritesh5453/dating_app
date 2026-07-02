import 'package:dio/dio.dart';
import '../../../core/network/dio_client.dart';
import '../model/home_model.dart';

class HomeRepository {
  final Dio _dio = DioClient().dio;

  Future<List<HomeModel>> fetchUsers({int count = 20}) async {
    try {
      final Response response = await _dio.get(
        '/',
        queryParameters: {
          'results': count,
        },
      );

      final List<dynamic> results = response.data['results'];

      return results
          .map((json) => HomeModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to load users');
    }
  }
}
import 'package:ostello/core/network/dio_client_interceptor.dart';
import 'package:ostello/features/streaming/data/models/doubts_model.dart';

abstract class DoubtsRemoteDataSource {
  Future<List<DoubtsModel>> getDoubts(String instituteId, String lectureId);
  Future<void> deleteDoubt(String doubtId);
  Future<void> addDoubt(Map<String, dynamic> doubtData);
}

class DoubtsRemoteDataSourceImpl implements DoubtsRemoteDataSource {
  final DioClient dioClient = DioClient();

  @override
  Future<List<DoubtsModel>> getDoubts(
      String instituteId, String lectureId) async {
    try {
      final response = await dioClient.dio.get(
        '/onlineCourses/doubt',
        queryParameters: {
          'institute_id': instituteId,
          'online_lecture_id': lectureId,
          'limit': 20,
          'skip': 0,
          'order_by': 'created_at',
          'order': 'DESC'
        },
      );
      final List<dynamic> data = response.data["data"];
      return data.map((json) => DoubtsModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch doubts: $e');
    }
  }

  @override
  Future<void> deleteDoubt(String doubtId) async {
    try {
      await dioClient.dio.delete('onlineCourses/doubts/$doubtId');
    } catch (e) {
      throw Exception('Failed to delete doubt: $e');
    }
  }

  @override
  Future<void> addDoubt(Map<String, dynamic> doubtData) async {
    try {
      await dioClient.dio.post('/onlineCourses/doubt',
          data: doubtData);
    } catch (e) {
      throw Exception('Failed to add doubt: $e');
    }
  }
}

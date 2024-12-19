import 'package:ostello/features/streaming/data/data_sources/doubts_remote_data_source.dart';
import 'package:ostello/features/streaming/data/models/doubts_model.dart';
import 'package:ostello/features/streaming/domain/repository/doubts_repository.dart';

class DoubtsRepositoryImpl extends DoubtsRepository {
  final DoubtsRemoteDataSource remoteDataSource;

  DoubtsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addDoubt(Map<String, dynamic> doubtData) async {
    await remoteDataSource.addDoubt(doubtData);
  }

  @override
  Future<void> deleteDoubt(String doubtId) async {
    await remoteDataSource.deleteDoubt(doubtId);
  }

  @override
  Future<List<DoubtsModel>> getDoubts(
      String instituteId, String lectureId) async {
    final doubts = await remoteDataSource.getDoubts(instituteId, lectureId);
    return doubts;
  }
}

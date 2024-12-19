import 'package:ostello/features/streaming/domain/entities/doubts_entity.dart';

abstract class DoubtsRepository {
  Future<List<DoubtsEntity>> getDoubts(
      String instituteId, String lectureId);

  Future<void> deleteDoubt(String doubtId);

  Future<void> addDoubt(Map<String, dynamic> doubtData);
  
}

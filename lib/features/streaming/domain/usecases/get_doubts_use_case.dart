import 'package:ostello/features/streaming/domain/entities/doubts_entity.dart';
import 'package:ostello/features/streaming/domain/repository/doubts_repository.dart';

class GetDoubtsUseCase {
  final DoubtsRepository repository;

  GetDoubtsUseCase(this.repository);

  Future<List<DoubtsEntity>> call(String instituteId, String lectureId) {
    return repository.getDoubts(instituteId, lectureId);
  }
}

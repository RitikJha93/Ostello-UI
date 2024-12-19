import 'package:ostello/features/streaming/domain/repository/doubts_repository.dart';

class DeleteDoubtsUseCase {
  final DoubtsRepository repository;

  DeleteDoubtsUseCase(this.repository);

  Future<void> call(String doubtId) {
    return repository.deleteDoubt(doubtId);
  }
}

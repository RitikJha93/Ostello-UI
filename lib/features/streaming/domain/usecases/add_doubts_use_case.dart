import 'package:ostello/features/streaming/domain/repository/doubts_repository.dart';

class AddDoubtsUseCase {
  final DoubtsRepository repository;

  AddDoubtsUseCase(this.repository);

  Future<void> call(Map<String, dynamic> doubtData) {
    return repository.addDoubt(doubtData);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/features/streaming/data/data_sources/doubts_remote_data_source.dart';
import 'package:ostello/features/streaming/data/repository/doubts_repository_impl.dart';
import 'package:ostello/features/streaming/domain/entities/doubts_entity.dart';
import 'package:ostello/features/streaming/domain/usecases/add_doubts_use_case.dart';
import 'package:ostello/features/streaming/domain/usecases/get_doubts_use_case.dart';

class DoubtsProvider extends ChangeNotifier {
  List<DoubtsEntity> doubts = [];
  bool isLoading = false;
  bool addLoading = false;
  String? errorMessage;

  DoubtsProvider() {
    getDoubtsApi();
  }

  void getDoubtsApi({loadingIndicator = true}) async {
    try {
      if (loadingIndicator) {
        isLoading = true;
      }
      errorMessage = null;
      notifyListeners();

      final DoubtsRepositoryImpl repository =
          DoubtsRepositoryImpl(remoteDataSource: DoubtsRemoteDataSourceImpl());

      doubts = await GetDoubtsUseCase(repository).call(
        "d2d75311-4323-43c2-8e1a-f4e136a95a64",
        "3ac9d364-42a7-4ac6-a6f4-0f34ca97b792",
      );
    } catch (e) {
      errorMessage = 'Failed to fetch doubts: ${e.toString()}';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void addDoubtApi(String title, String description) async {
    try {
      addLoading = true;
      errorMessage = null;
      notifyListeners();

      final DoubtsRepositoryImpl repository =
          DoubtsRepositoryImpl(remoteDataSource: DoubtsRemoteDataSourceImpl());

      final Map<String, dynamic> body = {
        "doubt_text": title,
        "doubt_description": description,
        "online_lecture": "3ac9d364-42a7-4ac6-a6f4-0f34ca97b792",
        "online_course": "5db3eb2b-f6fa-4b25-99c6-cc57efe3282a",
        "institute": "d2d75311-4323-43c2-8e1a-f4e136a95a64",
        "student": "2a405e0c-a859-47e0-b3b9-668e3dd04bb7"
      };

      await AddDoubtsUseCase(repository).call(body);

      getDoubtsApi(loadingIndicator: false);
    } catch (e) {
      errorMessage = 'Failed to Create new doubt: ${e.toString()}';
    } finally {
      addLoading = false;
      notifyListeners();
    }
  }
}

final doubtsNotifierProvider = ChangeNotifierProvider((ref) {
  return DoubtsProvider();
});

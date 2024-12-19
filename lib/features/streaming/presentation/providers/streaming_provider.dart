import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/core/res/assets_paths.dart';

class StreamingNotifier extends ChangeNotifier {

  //list of all the tab items
  List<Map<String, dynamic>> tabItems = [
    {"icon": AssetsPath.chatIconPath, "label": "Chat"},
    {"icon": AssetsPath.doubtsIconPath, "label": "Doubts"},
    {"icon": AssetsPath.notesIconPath, "label": "Notes"},
    {"icon": AssetsPath.rewardsIconPath, "label": "Rewards"},
  ];

  int activeTabIdx = 1;
  bool isQuestionPage = false;
  bool isAllQuestionPage = false;

  //updating tab index to switch between tabs
  void updateTabIndex(int index) {
    activeTabIdx = index;
    notifyListeners();
  }

  //toggling between doubts tab and ask question section
  void toggleQuestionPage() {
    isQuestionPage = !isQuestionPage;
    notifyListeners();
  }

  //toggling between all questions display section and doubts tab
  void toggleAllQuestionPage() {
    isAllQuestionPage = !isAllQuestionPage;
    notifyListeners();
  }
}

final streamingNotifierProvider = ChangeNotifierProvider((ref) {
  return StreamingNotifier();
});

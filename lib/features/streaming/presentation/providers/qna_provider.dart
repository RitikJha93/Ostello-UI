import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/features/streaming/data/models/qna_model.dart';

class QnaNotifier extends ChangeNotifier {

  //qna list to be displayed on all question section
  List<Qna> qnaList = [
    Qna(
        name: "Shabaz Ali",
        username: "@student name",
        question: "How can the user click on different ads",
        details:
            "I don't understand one thing in this topic that how can a user click on the navigation bar and go on the next field Bla Vla and yuppies please explain me the answer of my trigonometry \n\n Thanks Shahbaz",
        noOfReplies: 2,
        replies: [
          Replies(
              details:
                  "Hi Shahbaz, let me answer your question first you have to find the cosec and then work on it below.I hope this clears your doubt.",
              name: "VR Academy"),
          Replies(
              details:
                  "I also had the samilar query and i don’t think so i understand this part properly..",
              name: "Arshdeep Singh"),
        ]),
    Qna(
        username: "@student name",
        question: "How can the user click on different ads",
        details:
            "I don't understand one thing in this topic that how can a user click on the navigation bar and go on the next field",
        noOfReplies: 2),
  ];


  //adding new qna
  void addQna(String question, String details) {
    qnaList.add(Qna(question: question, details: details));
  }

}

final qnaNotifierProvider = ChangeNotifierProvider((ref) {
  return QnaNotifier();
});

import 'package:ostello/features/streaming/data/models/institute_model.dart';
import 'package:ostello/features/streaming/data/models/online_course_model.dart';
import 'package:ostello/features/streaming/data/models/online_lecture_model.dart';
import 'package:ostello/features/streaming/data/models/reply_model.dart';
import 'package:ostello/features/streaming/data/models/student_model.dart';
import 'package:ostello/features/streaming/domain/entities/doubts_entity.dart';

class DoubtsModel extends DoubtsEntity {
  DoubtsModel(
      {required super.id,
      required super.doubtText,
      required super.doubtDescription,
      required super.doubtImage,
      required super.createdAt,
      required super.updatedAt,
      required super.student,
      required super.institute,
      required super.onlineCourse,
      required super.onlineLecture,
      required super.replies});

  factory DoubtsModel.fromJson(Map<String, dynamic> json) {
    return DoubtsModel(
      id: json['id'],
      doubtText: json['doubt_text'],
      doubtDescription: json['doubt_description'],
      doubtImage: json['doubt_image'], // dynamic type
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      student: StudentModel.fromJson(json['student'] as Map<String, dynamic>),
      institute:
          InstituteModel.fromJson(json['institute'] as Map<String, dynamic>),
      onlineCourse: OnlineCourseModel.fromJson(
          json['online_course'] as Map<String, dynamic>),
      onlineLecture: OnlineLectureModel.fromJson(
          json['online_lecture'] as Map<String, dynamic>),
      replies: (json['replies'] as List<dynamic>)
          .map((reply) => ReplyModel.fromJson(reply as Map<String, dynamic>))
          .toList(),
    );
  }
}

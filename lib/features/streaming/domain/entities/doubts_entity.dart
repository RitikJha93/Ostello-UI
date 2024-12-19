import 'package:ostello/features/streaming/domain/entities/institute_entity.dart';
import 'package:ostello/features/streaming/domain/entities/online_course_entity.dart';
import 'package:ostello/features/streaming/domain/entities/online_lecture.dart';
import 'package:ostello/features/streaming/domain/entities/reply_entity.dart';
import 'package:ostello/features/streaming/domain/entities/student_entity.dart';

class DoubtsEntity {
  String id;
  String doubtText;
  String doubtDescription;
  dynamic doubtImage;
  DateTime createdAt;
  DateTime updatedAt;
  StudentEntity student;
  InstituteEntity institute;
  OnlineCourseEntity onlineCourse;
  OnlineLectureEntity onlineLecture;
  List<ReplyEntity> replies;

  DoubtsEntity({
    required this.id,
    required this.doubtText,
    required this.doubtDescription,
    required this.doubtImage,
    required this.createdAt,
    required this.updatedAt,
    required this.student,
    required this.institute,
    required this.onlineCourse,
    required this.onlineLecture,
    required this.replies,
  });
}

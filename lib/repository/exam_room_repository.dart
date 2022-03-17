import 'package:valua_staff/models/assigned_exam_room.dart';

abstract class ExamRoomRepository {
  Future<AssignedExamRoom> getAssignedExamRoom();
}

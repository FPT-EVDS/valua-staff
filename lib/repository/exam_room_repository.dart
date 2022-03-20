import 'package:valua_staff/models/assigned_exam_room.dart';
import 'package:valua_staff/models/assigned_shift.dart';
import 'package:valua_staff/models/shift_detail.dart';

abstract class ExamRoomRepository {
  Future<AssignedExamRoom> getAssignedExamRoom();
  Future<AssignedShift> getAssignedShift({String? semesterId});
  Future<ShiftDetail> getShiftDetail(String id);
}

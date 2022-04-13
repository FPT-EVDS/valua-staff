import 'package:valua_staff/models/assigned_exam_room.dart';
import 'package:valua_staff/models/assigned_shift.dart';
import 'package:valua_staff/providers/base_provider.dart';
import 'package:valua_staff/repository/exam_room_repository.dart';

class ExamRoomProvider extends BaseProvider implements ExamRoomRepository {
  @override
  Future<AssignedShift> getAssignedShift({String? semesterId}) async {
    final response = await get("/examRooms/assigned", query: {
      "semesterId": semesterId,
    });
    if (response.status.hasError) {
      throw (response.body);
    }
    return AssignedShift.fromJson(response.body);
  }

  @override
  Future<AssignedExamRoom> getAssignedExamRoom() async {
    final response = await get("/examRooms/assigned/now");
    if (response.status.hasError) {
      throw (response.body);
    }
    return AssignedExamRoom.fromJson(response.body);
  }
}

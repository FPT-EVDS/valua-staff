import 'package:valua_staff/models/assigned_shift.dart';
import 'package:valua_staff/models/shift_detail.dart';
import 'package:valua_staff/models/shifts_registration.dart';
import 'package:valua_staff/providers/base_provider.dart';
import 'package:valua_staff/repository/shift_repository.dart';

class ShiftProvider extends BaseProvider implements ShiftRepository {
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
  Future<ShiftDetail> getShiftDetail(String id) async {
    final response = await get("/examRooms/$id");
    if (response.status.hasError) {
      throw (response.body);
    }
    return ShiftDetail.fromJson(response.body);
  }

  @override
  Future<ShiftsRegistration> getAvailableShifts() async {
    final response = await get("/shifts/register");
    if (response.status.hasError) {
      throw (response.body);
    }
    return ShiftsRegistration.fromJson(response.body);
  }

  @override
  Future<bool> registerShift(String shiftId) async {
    final response = await post("/shifts/register/$shiftId", {});
    if (response.status.hasError) {
      throw (response.body);
    }
    // too lazy
    return true;
  }
}

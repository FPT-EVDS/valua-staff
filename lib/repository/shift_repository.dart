import 'package:valua_staff/models/assigned_shift.dart';
import 'package:valua_staff/models/shift_detail.dart';
import 'package:valua_staff/models/shifts_registration.dart';

abstract class ShiftRepository {
  Future<AssignedShift> getAssignedShift({String? semesterId});
  Future<ShiftDetail> getShiftDetail(String id);
  Future<ShiftsRegistration> getAvailableShifts();
  Future<bool> registerShift(String shiftId);
}

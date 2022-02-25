import 'package:valua_staff/models/assigned_shift.dart';
import 'package:valua_staff/models/shift_detail.dart';

abstract class ShiftRepository {
  Future<AssignedShift> getAssignedShift({String? semesterId});
  Future<ShiftDetail> getShiftDetail(String id);
}

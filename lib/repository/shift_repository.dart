import 'package:valua_staff/models/shifts_registration.dart';

abstract class ShiftRepository {
  Future<ShiftsRegistration> getAvailableShifts();
  Future<bool> registerShift(String shiftId);
  Future<bool> registerShifts(List<String> shiftIds);
}

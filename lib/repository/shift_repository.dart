import 'package:valua_staff/models/shifts_registration.dart';

abstract class ShiftRepository {
  Future<ShiftsRegistration> getAvailableShifts();
  Future<bool> registerShift(String shiftId);
}

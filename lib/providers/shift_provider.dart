import 'package:valua_staff/models/shifts_registration.dart';
import 'package:valua_staff/providers/base_provider.dart';
import 'package:valua_staff/repository/shift_repository.dart';

class ShiftProvider extends BaseProvider implements ShiftRepository {
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

  @override
  Future<bool> registerShifts(List<String> shiftIds) async {
    // Should handle this in controller
    // But i'm lazy
    final payload = shiftIds.map((shiftId) => ({"shiftId": shiftId})).toList();
    final response = await post("/shifts/register", payload);
    if (response.status.hasError) {
      throw (response.body);
    }
    return true;
  }
}

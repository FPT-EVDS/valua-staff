import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:valua_staff/models/shifts_registration.dart';
import 'package:valua_staff/providers/shift_provider.dart';
import 'package:valua_staff/repository/shift_repository.dart';

class ShiftRegistrationController extends GetxController {
  final availableShifts = Future<ShiftsRegistration?>.value().obs;
  final DateFormat formatter = DateFormat('EEEE, dd/MM/yyyy');
  final DateFormat timeFormatter = DateFormat('HH:mm');
  final ShiftRepository _shiftRepository = Get.find<ShiftProvider>();
  RxList<bool> isExpandedList = RxList<bool>();

  Future<void> getAvailableShifts() async {
    try {
      final data = _shiftRepository.getAvailableShifts().then((value) {
        isExpandedList.value =
            List.generate(value.shifts.length, (index) => true);
        return value;
      });
      availableShifts.value = data;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<bool> registerShift(String shiftId) async {
    try {
      final data = _shiftRepository.registerShift(shiftId);
      return data;
    } catch (err) {
      throw Exception(err);
    }
  }

  Map<String, List<ShiftsRegistrationDetail>> getAvailableShiftByDate(
      List<ShiftsRegistrationDetail> shifts) {
    Map<String, List<ShiftsRegistrationDetail>> result = {};
    for (var shift in shifts) {
      String date = formatter.format(shift.beginTime);
      result.update(
        date,
        (v) => [...?result[date], shift],
        ifAbsent: () => [shift],
      );
    }
    return result;
  }

  bool isNight(DateTime date) {
    return date.hour > 17 && date.hour < 23;
  }

  @override
  void onInit() {
    getAvailableShifts();
    super.onInit();
  }
}

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
  final listSelectedShifts = RxSet<String>();
  RxList<bool> isExpandedList = RxList<bool>();

  Future<void> getAvailableShifts() async {
    try {
      final data = _shiftRepository.getAvailableShifts().then((value) {
        isExpandedList.value =
            List.generate(value.shifts.length, (index) => true);
        return value;
      });
      listSelectedShifts.clear();
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

  Future<bool> registerShifts() async {
    try {
      final data = _shiftRepository.registerShifts(listSelectedShifts.toList());
      return data;
    } catch (err) {
      throw Exception(err);
    }
  }

  Map<String, List<ShiftsRegistrationDetail>> getAvailableShiftByDate(
      List<ShiftsRegistrationDetail> shifts) {
    Map<String, List<ShiftsRegistrationDetail>> result = {};
    for (var shift in shifts) {
      String date = formatter.format(shift.beginTime.toLocal());
      result.update(
        date,
        (v) => [...?result[date], shift],
        ifAbsent: () => [shift],
      );
    }
    return result;
  }

  @override
  void onInit() {
    getAvailableShifts();
    super.onInit();
  }
}

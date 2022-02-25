import 'package:get/get.dart';
import 'package:valua_staff/models/assigned_shift.dart';
import 'package:valua_staff/providers/shift_provider.dart';
import 'package:valua_staff/repository/shift_repository.dart';

class HomeController extends GetxController {
  final assignedShiftList = Future<AssignedShift?>.value().obs;
  final ShiftRepository _shiftRepository = Get.find<ShiftProvider>();

  Future<void> getAssignedShift({DateTime? date}) async {
    try {
      final data = _shiftRepository.getAssignedShift();
      assignedShiftList.value = data;
    } catch (err) {
      throw Exception(err);
    }
  }

  @override
  void onInit() {
    getAssignedShift();
    super.onInit();
  }
}

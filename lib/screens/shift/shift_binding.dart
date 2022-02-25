import 'package:get/get.dart';
import 'package:valua_staff/providers/semester_provider.dart';
import 'package:valua_staff/providers/shift_provider.dart';
import 'package:valua_staff/screens/shift/shift_controller.dart';

class ShiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShiftController>(() => ShiftController());
    Get.lazyPut<ShiftProvider>(() => ShiftProvider());
    Get.lazyPut<SemesterProvider>(() => SemesterProvider());
  }
}

import 'package:get/get.dart';
import 'package:valua_staff/providers/shift_provider.dart';
import 'package:valua_staff/screens/shift_registration/shift_registration_controller.dart';

class ShiftRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShiftProvider>(() => ShiftProvider());
    Get.lazyPut<ShiftRegistrationController>(
        () => ShiftRegistrationController());
  }
}

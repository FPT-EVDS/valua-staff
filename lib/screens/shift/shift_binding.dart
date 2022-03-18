import 'package:get/get.dart';
import 'package:valua_staff/providers/exam_room_provider.dart';
import 'package:valua_staff/providers/semester_provider.dart';
import 'package:valua_staff/screens/shift/shift_controller.dart';

class ShiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShiftController>(() => ShiftController());
    Get.lazyPut<ExamRoomProvider>(() => ExamRoomProvider());
    Get.lazyPut<SemesterProvider>(() => SemesterProvider());
  }
}

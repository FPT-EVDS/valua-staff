import 'package:get/get.dart';
import 'package:valua_staff/providers/exam_room_provider.dart';
import 'package:valua_staff/screens/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ExamRoomProvider>(() => ExamRoomProvider());
  }
}

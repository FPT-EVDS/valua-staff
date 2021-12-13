import 'package:evds_staff/screens/login/login_controller.dart';
import 'package:evds_staff/providers/auth_provider.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:valua_staff/providers/qr_provider.dart';
import 'package:valua_staff/repository/qr_repository.dart';
import 'package:valua_staff/services/local_notification_service.dart';

class MainController extends GetxController {
  final tabIndex = 0.obs;
  final appBarTitle = "".obs;
  final List<String> _listTitles = ["", "Notifications", ""];
  final QRRepository _qrProvider = Get.find<QRProvider>();

  void changeTabIndex(int newTabIndex) {
    tabIndex.value = newTabIndex;
    appBarTitle.value = _listTitles[newTabIndex];
    if (newTabIndex == 1) {
      LocalNotificationService.hasUnreadMessage.value = false;
    }
  }

  void validateLoginQRCode(String qrToken) async {
    try {
      await _qrProvider.validateLoginQR(qrToken);
    } catch (error) {
      Fluttertoast.showToast(
        msg: "Invalid QR Code",
        backgroundColor: Colors.grey.shade700,
      );
    }
  }
}

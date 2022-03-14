import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:valua_staff/providers/qr_provider.dart';
import 'package:valua_staff/repository/qr_repository.dart';

class MainController extends GetxController {
  final tabIndex = 0.obs;
  final appBarTitle = "".obs;
  final List<String> _listTitles = ["", "Notifications", ""];
  final QRRepository _qrProvider = Get.find<QRProvider>();

  void changeTabIndex(int newTabIndex) {
    tabIndex.value = newTabIndex;
    appBarTitle.value = _listTitles[newTabIndex];
  }

  void validateLoginQRCode(String qrToken) async {
    try {
      final data = await _qrProvider.validateLoginQR(qrToken);
      if (data.status == false) {
        Fluttertoast.showToast(
          msg: data.message,
          backgroundColor: Colors.grey.shade700,
        );
      }
    } catch (error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.grey.shade700,
      );
    }
  }
}

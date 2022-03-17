import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:valua_staff/models/assigned_exam_room.dart';
import 'package:valua_staff/providers/exam_room_provider.dart';
import 'package:valua_staff/repository/exam_room_repository.dart';

class HomeController extends GetxController {
  final assignedExamRoom = Rx<AssignedExamRoom?>(null);
  final assignedExamRoomFuture = Future<AssignedExamRoom?>.value().obs;
  final shiftTitle = "Today's shift".obs;
  final ExamRoomRepository _provider = Get.find<ExamRoomProvider>();

  Future<AssignedExamRoom?> getAssignedExamRoom() async {
    try {
      final data = _provider.getAssignedExamRoom().then((value) {
        assignedExamRoom.value = value;
        final shiftBeginTime = value.currentShift.beginTime.toLocal();
        final shiftEndTime = value.currentShift.finishTime.toLocal();
        final currentTime = DateTime.now();
        if (currentTime.isBefore(shiftBeginTime)) {
          shiftTitle.value = 'Next shift';
        } else if (currentTime.isAfter(shiftBeginTime) &&
            currentTime.isBefore(shiftEndTime)) {
          shiftTitle.value = 'Current shift';
        }
      });
      assignedExamRoomFuture.value = data;
      return data;
    } catch (err) {
      Fluttertoast.showToast(
        msg: err.toString(),
        backgroundColor: Colors.grey.shade700,
      );
      throw Exception(err);
    }
  }

  @override
  void onInit() {
    getAssignedExamRoom();
    super.onInit();
  }
}

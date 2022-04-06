import 'package:get/get.dart';
import 'package:valua_staff/models/assigned_shift.dart';
import 'package:valua_staff/models/semester.dart';
import 'package:valua_staff/providers/exam_room_provider.dart';
import 'package:valua_staff/providers/semester_provider.dart';
import 'package:valua_staff/repository/exam_room_repository.dart';
import 'package:valua_staff/repository/semester_repository.dart';

class ShiftController extends GetxController {
  final assignedShiftList = Future<AssignedShift?>.value().obs;
  final currentSemester = Rx<Semester?>(null);
  final ExamRoomRepository _provider = Get.find<ExamRoomProvider>();
  final SemesterRepository _semesterRepository = Get.find<SemesterProvider>();
  RxList<String> sectionTitles =
      ["Next shift", "Upcoming shifts", "Finished shifts"].obs;
  RxList<bool> isExpandedList = RxList<bool>();

  Future<void> getAssignedShift({String? semesterId}) async {
    try {
      assignedShiftList.value =
          _provider.getAssignedShift(semesterId: semesterId);
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<List<Semester>> getListSemesters() async {
    try {
      // Get actived semesters only
      final data = await _semesterRepository.getSemesters(status: 1);
      return data.semesters;
    } catch (err) {
      throw Exception(err);
    }
  }

  void handleChangeSemester(Semester? semester) {
    if (semester != null) {
      currentSemester.value = semester;
      getAssignedShift(semesterId: semester.semesterId);
    }
  }

  @override
  void onInit() {
    isExpandedList.value = List.generate(sectionTitles.length, (index) {
      if (index == sectionTitles.length - 1) {
        return false;
      }
      return true;
    });
    String? semesterId = Get.arguments?["semesterId"];
    if (semesterId != null) {
      getListSemesters().then(
        (value) {
          final semester =
              value.firstWhere((element) => element.semesterId == semesterId);
          currentSemester.value = semester;
          return getAssignedShift(semesterId: semesterId);
        },
      );
    } else {
      getListSemesters().then(
        (value) => getAssignedShift(semesterId: value.first.semesterId),
      );
    }
    super.onInit();
  }
}

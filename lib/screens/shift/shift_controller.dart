import 'package:get/get.dart';
import 'package:valua_staff/models/assigned_shift.dart';
import 'package:valua_staff/models/semester.dart';
import 'package:valua_staff/providers/semester_provider.dart';
import 'package:valua_staff/providers/shift_provider.dart';
import 'package:valua_staff/repository/semester_repository.dart';
import 'package:valua_staff/repository/shift_repository.dart';

class ShiftController extends GetxController {
  final assignedShiftList = Future<AssignedShift?>.value().obs;
  final Rx<Semester>? currentSemester = null;
  final ShiftRepository _shiftRepository = Get.find<ShiftProvider>();
  final SemesterRepository _semesterRepository = Get.find<SemesterProvider>();

  Future<void> getAssignedShift({String? semesterId}) async {
    try {
      assignedShiftList.value =
          _shiftRepository.getAssignedShift(semesterId: semesterId);
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<List<Semester>> getListSemesters() async {
    try {
      final data = await _semesterRepository.getSemesters();
      return data.semesters;
    } catch (err) {
      throw Exception(err);
    }
  }

  void handleChangeSemester(Semester? semester) {
    if (semester != null) {
      currentSemester?.value = semester;
      getAssignedShift(semesterId: semester.semesterId);
    }
  }

  @override
  void onInit() {
    String? semesterId = Get.arguments?["semesterId"];
    if (semesterId != null) {
      getListSemesters().then(
        (value) {
          final semester =
              value.firstWhere((element) => element.semesterId == semesterId);
          currentSemester?.value = semester;
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

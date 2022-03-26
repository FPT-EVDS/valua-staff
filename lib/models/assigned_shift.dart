import 'package:json_annotation/json_annotation.dart';
import 'package:valua_staff/models/shift_detail.dart';
part 'assigned_shift.g.dart';

@JsonSerializable()
class AssignedShift {
  int totalItems;
  ShiftDetail? currentShift;
  ShiftDetail? nextShift;
  SelectedSemester selectedSemester;
  List<ShiftDetail> upcomingShifts;
  List<ShiftDetail> finishedShifts;

  AssignedShift({
    required this.totalItems,
    this.currentShift,
    this.nextShift,
    required this.selectedSemester,
    required this.upcomingShifts,
    required this.finishedShifts,
  });

  factory AssignedShift.fromJson(Map<String, dynamic> json) =>
      _$AssignedShiftFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedShiftToJson(this);
}

@JsonSerializable()
class SelectedSemester {
  String semesterId;
  String semesterName;

  SelectedSemester({
    required this.semesterId,
    required this.semesterName,
  });

  factory SelectedSemester.fromJson(Map<String, dynamic> json) =>
      _$SelectedSemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedSemesterToJson(this);
}

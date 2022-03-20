import 'package:json_annotation/json_annotation.dart';
import 'package:valua_staff/models/shift_detail.dart';
part 'assigned_shift.g.dart';

@JsonSerializable()
class AssignedShift {
  int totalItems;
  List<ShiftDetail> assignedShifts;
  SelectedSemester selectedSemester;

  AssignedShift({
    required this.totalItems,
    required this.assignedShifts,
    required this.selectedSemester,
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

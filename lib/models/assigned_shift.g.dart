// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedShift _$AssignedShiftFromJson(Map<String, dynamic> json) =>
    AssignedShift(
      totalItems: json['totalItems'] as int,
      assignedShifts: (json['assignedShifts'] as List<dynamic>)
          .map((e) => ShiftDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedSemester: SelectedSemester.fromJson(
          json['selectedSemester'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssignedShiftToJson(AssignedShift instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'assignedShifts': instance.assignedShifts,
      'selectedSemester': instance.selectedSemester,
    };

SelectedSemester _$SelectedSemesterFromJson(Map<String, dynamic> json) =>
    SelectedSemester(
      semesterId: json['semesterId'] as String,
      semesterName: json['semesterName'] as String,
    );

Map<String, dynamic> _$SelectedSemesterToJson(SelectedSemester instance) =>
    <String, dynamic>{
      'semesterId': instance.semesterId,
      'semesterName': instance.semesterName,
    };

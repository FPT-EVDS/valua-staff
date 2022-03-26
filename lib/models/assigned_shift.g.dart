// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedShift _$AssignedShiftFromJson(Map<String, dynamic> json) =>
    AssignedShift(
      totalItems: json['totalItems'] as int,
      currentShift: json['currentShift'] == null
          ? null
          : ShiftDetail.fromJson(json['currentShift'] as Map<String, dynamic>),
      nextShift: json['nextShift'] == null
          ? null
          : ShiftDetail.fromJson(json['nextShift'] as Map<String, dynamic>),
      selectedSemester: SelectedSemester.fromJson(
          json['selectedSemester'] as Map<String, dynamic>),
      upcomingShifts: (json['upcomingShifts'] as List<dynamic>)
          .map((e) => ShiftDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      finishedShifts: (json['finishedShifts'] as List<dynamic>)
          .map((e) => ShiftDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssignedShiftToJson(AssignedShift instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'currentShift': instance.currentShift,
      'nextShift': instance.nextShift,
      'selectedSemester': instance.selectedSemester,
      'upcomingShifts': instance.upcomingShifts,
      'finishedShifts': instance.finishedShifts,
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

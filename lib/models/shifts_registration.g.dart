// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shifts_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftsRegistration _$ShiftsRegistrationFromJson(Map<String, dynamic> json) =>
    ShiftsRegistration(
      shifts: (json['shifts'] as List<dynamic>)
          .map((e) =>
              ShiftsRegistrationDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShiftsRegistrationToJson(ShiftsRegistration instance) =>
    <String, dynamic>{
      'shifts': instance.shifts,
    };

ShiftsRegistrationDetail _$ShiftsRegistrationDetailFromJson(
        Map<String, dynamic> json) =>
    ShiftsRegistrationDetail(
      availableSlots: json['availableSlots'] as int,
      beginTime: DateTime.parse(json['beginTime'] as String),
      finishTime: DateTime.parse(json['finishTime'] as String),
      shiftId: json['shiftId'] as String,
      status: $enumDecode(_$ShiftStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$ShiftsRegistrationDetailToJson(
        ShiftsRegistrationDetail instance) =>
    <String, dynamic>{
      'shiftId': instance.shiftId,
      'beginTime': instance.beginTime.toIso8601String(),
      'finishTime': instance.finishTime.toIso8601String(),
      'availableSlots': instance.availableSlots,
      'status': _$ShiftStatusEnumMap[instance.status],
    };

const _$ShiftStatusEnumMap = {
  ShiftStatus.removed: 0,
  ShiftStatus.finished: 1,
  ShiftStatus.locked: 2,
  ShiftStatus.ready: 3,
  ShiftStatus.notReady: 4,
  ShiftStatus.staffing: 5,
  ShiftStatus.ongoing: 6,
};

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
      beginTime: json['beginTime'],
      finishTime: json['finishTime'],
      shiftId: json['shiftId'],
      status: json['status'],
    );

Map<String, dynamic> _$ShiftsRegistrationDetailToJson(
        ShiftsRegistrationDetail instance) =>
    <String, dynamic>{
      'shiftId': instance.shiftId,
      'beginTime': instance.beginTime.toIso8601String(),
      'finishTime': instance.finishTime.toIso8601String(),
      'status': instance.status,
      'availableSlots': instance.availableSlots,
    };

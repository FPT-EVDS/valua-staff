// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shift _$ShiftFromJson(Map<String, dynamic> json) => Shift(
      shiftId: json['shiftId'] as String,
      beginTime: DateTime.parse(json['beginTime'] as String),
      finishTime: DateTime.parse(json['finishTime'] as String),
      status: json['status'] as int,
    );

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'shiftId': instance.shiftId,
      'beginTime': instance.beginTime.toIso8601String(),
      'finishTime': instance.finishTime.toIso8601String(),
      'status': instance.status,
    };

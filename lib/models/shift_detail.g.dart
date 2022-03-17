// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftDetail _$ShiftDetailFromJson(Map<String, dynamic> json) => ShiftDetail(
      examRoomId: json['examRoomId'] as String,
      shift: Shift.fromJson(json['shift'] as Map<String, dynamic>),
      room: Room.fromJson(json['room'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShiftDetailToJson(ShiftDetail instance) =>
    <String, dynamic>{
      'examRoomId': instance.examRoomId,
      'shift': instance.shift,
      'room': instance.room,
    };

Shift _$ShiftFromJson(Map<String, dynamic> json) => Shift(
      shiftId: json['shiftId'] as String,
      beginTime: DateTime.parse(json['beginTime'] as String),
      finishTime: DateTime.parse(json['finishTime'] as String),
      status: $enumDecode(_$ShiftStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'shiftId': instance.shiftId,
      'beginTime': instance.beginTime.toIso8601String(),
      'finishTime': instance.finishTime.toIso8601String(),
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftDetail _$ShiftDetailFromJson(Map<String, dynamic> json) => ShiftDetail(
      examRoomId: json['examRoomID'] as String,
      examRoomName: json['examRoomName'] as String,
      shift: Shift.fromJson(json['shift'] as Map<String, dynamic>),
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
      room: Room.fromJson(json['room'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShiftDetailToJson(ShiftDetail instance) =>
    <String, dynamic>{
      'examRoomID': instance.examRoomId,
      'examRoomName': instance.examRoomName,
      'shift': instance.shift,
      'subject': instance.subject,
      'room': instance.room,
    };

Shift _$ShiftFromJson(Map<String, dynamic> json) => Shift(
      shiftId: json['shiftId'] as String,
      beginTime: DateTime.parse(json['beginTime'] as String),
      finishTime: DateTime.parse(json['finishTime'] as String),
    );

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'shiftId': instance.shiftId,
      'beginTime': instance.beginTime.toIso8601String(),
      'finishTime': instance.finishTime.toIso8601String(),
    };

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

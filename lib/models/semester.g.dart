// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Semester _$SemesterFromJson(Map<String, dynamic> json) => Semester(
      semesterId: json['semesterId'] as String,
      semesterName: json['semesterName'] as String,
      beginDate: DateTime.parse(json['beginDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'semesterId': instance.semesterId,
      'semesterName': instance.semesterName,
      'beginDate': instance.beginDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'isActive': instance.isActive,
    };

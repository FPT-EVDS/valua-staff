// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrLoginResponse _$QrLoginResponseFromJson(Map<String, dynamic> json) =>
    QrLoginResponse(
      message: json['message'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$QrLoginResponseToJson(QrLoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };

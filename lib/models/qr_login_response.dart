import 'package:json_annotation/json_annotation.dart';
part 'qr_login_response.g.dart';

@JsonSerializable()
class QrLoginResponse {
  String message;
  bool status;

  QrLoginResponse({
    required this.message,
    required this.status,
  });

  factory QrLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$QrLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QrLoginResponseToJson(this);
}

import 'package:valua_staff/models/qr_login_response.dart';

abstract class QRRepository {
  Future<QrLoginResponse> validateLoginQR(String qrToken);
}

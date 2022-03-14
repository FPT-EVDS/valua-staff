import 'package:valua_staff/models/qr_login_response.dart';
import 'package:valua_staff/providers/base_provider.dart';
import 'package:valua_staff/repository/qr_repository.dart';

class QRProvider extends BaseProvider implements QRRepository {
  @override
  Future<QrLoginResponse> validateLoginQR(String qrToken) async {
    final response = await post("/qrcode/scan/login/$qrToken", {});
    if (response.status.hasError) {
      throw (response.body);
    }
    return QrLoginResponse.fromJson(response.body);
  }
}

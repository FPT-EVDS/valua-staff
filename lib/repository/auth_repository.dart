import 'package:get/get.dart';
import 'package:valua_staff/models/account.dart';
import 'package:valua_staff/models/app_user.dart';

abstract class AuthRepository {
  Future<String> refreshToken();
  Future<AppUser> login(String email, String password);
  Future<Account> getProfile();
  Future<Account> updateProfile(FormData newProfile);
  Future<String> changePassword(String currentPassword, String newPassword);
  Future<AppUser> loginWithGoogle(String idToken);
}

import 'dart:convert';

import 'package:valua_staff/models/account.dart';
import 'package:valua_staff/models/app_user.dart';
import 'package:valua_staff/providers/base_provider.dart';
import 'package:valua_staff/repository/auth_repository.dart';
import 'package:get_storage/get_storage.dart';

class AuthProvider extends BaseProvider implements AuthRepository {
  final GetStorage _storage = GetStorage();

  @override
  Future<AppUser> login(String email, String password) async {
    final response = await post("/authentication/login", {
      'email': email,
      'password': password,
    });
    if (response.status.hasError) {
      throw (response.body);
    }
    return AppUser.fromJson(response.body);
  }

  @override
  Future<String> refreshToken() async {
    final response = await get(
      "/authentication/refreshToken",
      headers: {
        "refreshToken": _storage.read("refresh_token").toString(),
      },
    );
    if (response.status.hasError) {
      throw (response.body);
    }
    return response.body["token"];
  }

  @override
  Future<Account> getProfile() async {
    final response = await get("/authentication/profile");
    if (response.status.hasError) {
      throw (response.body);
    }
    return Account.fromJson(response.body);
  }

  @override
  Future<Account> updateProfile(Account newProfile) async {
    final response = await put(
      "/authentication/profile",
      jsonEncode(newProfile),
    );
    if (response.status.hasError) {
      throw (response.body);
    }
    return Account.fromJson(response.body);
  }

  @override
  Future<String> changePassword(
      String currentPassword, String newPassword) async {
    final response = await post("/authentication/changePassword", {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    });
    if (response.status.hasError) {
      throw (response.body);
    }
    return response.body;
  }
}

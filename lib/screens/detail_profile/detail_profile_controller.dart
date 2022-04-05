import 'dart:convert';
import 'dart:io';

import 'package:cool_alert/cool_alert.dart';
import 'package:image_picker/image_picker.dart';
import 'package:valua_staff/constants/app.dart';
import 'package:valua_staff/models/account.dart';
import 'package:valua_staff/providers/auth_provider.dart';
import 'package:valua_staff/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class DetailProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final Account currentUser;
  final genders = ["Male", "Female"].obs;
  final ImagePicker _picker = ImagePicker();
  final image = Rx<XFile?>(null);
  late TextEditingController emailController,
      phoneController,
      birthdateController,
      fullNameController,
      addressController;
  late final dynamic gender;
  final AuthRepository _provider = Get.find<AuthProvider>();
  final isLoading = false.obs;
  final GetStorage _storage = GetStorage(AppConstant.storageKey);
  final DateFormat _dateFormat = DateFormat("dd/MM/yyyy");

  @override
  void onInit() {
    currentUser =
        Account.fromJson(jsonDecode(_storage.read(AppConstant.appUser)));
    emailController = TextEditingController(text: currentUser.email);
    birthdateController = TextEditingController(
        text: _dateFormat.format(DateTime.parse(currentUser.birthdate)));
    phoneController = TextEditingController(text: currentUser.phoneNumber);
    fullNameController = TextEditingController(text: currentUser.fullName);
    addressController = TextEditingController(text: currentUser.address);
    gender = currentUser.gender.toString().obs;
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    birthdateController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      this.image.value = image;
    }
  }

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dateFormat.parse(birthdateController.text),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      birthdateController.text = _dateFormat.format(picked);
    }
  }

  Future<void> updateProfile(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        final Account account = currentUser;
        account.fullName = fullNameController.text;
        account.gender = genders.indexOf(gender);
        account.address = addressController.text;
        account.phoneNumber = phoneController.text;
        account.birthdate = DateFormat("yyyy-MM-dd")
            .format(_dateFormat.parse(birthdateController.text));
        final FormData _formData = FormData({
          'account': jsonEncode({
            "fullName": account.fullName,
            "gender": account.gender,
            "birthdate": account.birthdate,
            "address": account.address,
            "phoneNumber": account.phoneNumber,
          }),
          if (image.value != null)
            'profilePicture': MultipartFile(
              File(image.value!.path),
              filename: image.value!.name,
            ),
        });
        final Account data = await _provider.updateProfile(_formData);
        data.gender = gender.value;
        _storage.write(AppConstant.appUser, jsonEncode(data));
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "Update profile success",
        );
      } catch (e) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          text: e.toString(),
        );
      } finally {
        isLoading.value = false;
      }
    }
  }
}

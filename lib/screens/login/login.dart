import 'package:community_material_icon/community_material_icon.dart';
import 'package:valua_staff/screens/login/login_controller.dart';
import 'package:valua_staff/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<LoginController>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "\u00a9 Valua for Staff 2022, All rights reserved",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade500,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    "assets/icons/valua.png",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                        ),
                        validator: MultiValidator([
                          EmailValidator(errorText: "Invalid email"),
                          RequiredValidator(errorText: "Email is required")
                        ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: _controller.passwordController,
                        decoration: const InputDecoration(
                          labelText: "Password",
                        ),
                        validator: RequiredValidator(
                          errorText: "Password is required",
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Obx(
                        () => RoundButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              _controller.login();
                            }
                          },
                          height: 45,
                          width: double.infinity,
                          label: "Login",
                          isLoading: _controller.isLoading.value,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundButton(
                        onPressed: () {
                          _controller.loginWithGoogle();
                        },
                        height: 45,
                        icon: const Icon(CommunityMaterialIcons.google),
                        width: double.infinity,
                        label: "Login with Google",
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

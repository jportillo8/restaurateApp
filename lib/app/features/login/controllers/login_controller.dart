import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  void login() {
    String email = emailCtrl.text.trim();
    String password = passwordCtrl.text.trim();

    print('Email: ${email}, pass: ${password}');
    if (isValidForm(email, password)) {
      Get.snackbar('Form valido', 'Peticion Http');
    }
  }

  bool isValidForm(String email, String pass) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Ingresa el Email');
      return false;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'Email no valido');
      return false;
    }
    if (pass.isEmpty) {
      Get.snackbar('Formulario no valido', 'Ingresa tu password');
      return false;
    }
    return true;
  }

  void goToRegisterSheet(BuildContext context, Widget child) {
    Get.back();
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) => child);
  }
}

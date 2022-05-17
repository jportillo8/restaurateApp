import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPassCtrl = TextEditingController();

  void register() {
    String name = nameCtrl.text;
    String phone = phoneCtrl.text.trim();
    String email = emailCtrl.text.trim();
    String password = passwordCtrl.text.trim();
    String confirmPass = confirmPassCtrl.text.trim();

    print(
        'Email: ${email}, pass: ${password}, Name: ${name}, phone: ${phone}, confirmPass: ${confirmPass}');

    if (isValidForm(name, phone, email, password, confirmPass)) {
      Get.snackbar('Form valido', 'Peticion Http');
    }
  }

  bool isValidForm(String name, String phone, String email, String pass,
      String confirmPass) {
    // Validate data
    if (name.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        pass.isEmpty ||
        confirmPass.isEmpty) {
      Get.snackbar('Formulario no valido', 'Ingresa todos los datos');
      return false;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'Email no valido');
      return false;
    }
    if (pass != confirmPass) {
      Get.snackbar('Formulario no valido', 'Password no coinciden');
      return false;
    }
    return true;
  }

  void goToLoginSheet(BuildContext context, Widget child) {
    Get.back();
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) => child);
  }
}

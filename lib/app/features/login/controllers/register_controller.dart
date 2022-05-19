import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';
import 'package:dev9lu_market_flutter/app/utils/services/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPassCtrl = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void register() async {
    String name = nameCtrl.text;
    String phone = phoneCtrl.text.trim();
    String email = emailCtrl.text.trim();
    String password = passwordCtrl.text.trim();
    String confirmPass = confirmPassCtrl.text.trim();

    print(
        'Email: ${email}, pass: ${password}, Name: ${name}, phone: ${phone}, confirmPass: ${confirmPass}');

    if (isValidForm(name, phone, email, password, confirmPass)) {
      User user =
          User(email: email, name: name, phone: phone, password: password);
      Response response = await usersProvider.create(user);

      print('RESPONSE: ${response.body}');

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

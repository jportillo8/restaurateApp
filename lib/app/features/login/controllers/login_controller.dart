import 'package:dev9lu_market_flutter/app/config/routes/app_pages.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/response_api.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';
import 'package:dev9lu_market_flutter/app/utils/services/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  // User userSession = User.fromJson(GetStorage().read('user') ?? {});

  UsersProvider usersProvider = UsersProvider();

  void login() async {
    final String email = emailCtrl.text.trim();
    final String password = passwordCtrl.text.trim();

    print('Email: ${email}, pass: ${password}');
    if (isValidForm(email, password)) {
      final ResponseApi responseApi =
          await usersProvider.login(email, password);
      print('Response Api ${responseApi.toJson()}');

      if (responseApi.success == true) {
        GetStorage().write('user', responseApi.data);

        User myUser = User.fromJson(GetStorage().read('user') ?? {});
        myUser.roles!.length > 1 ? goToRolesPage() : goToClientProductPage();
        Get.snackbar('Login Exitoso', responseApi.message ?? '');
      } else {
        Get.snackbar('Login Fallido', responseApi.message ?? '');
      }
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

  void goToClientProductPage() {
    Get.offNamedUntil(Routes.clientProductsList, (route) => false);
  }

  void goToRolesPage() {
    Get.offNamedUntil(Routes.roles, (route) => false);
  }
}

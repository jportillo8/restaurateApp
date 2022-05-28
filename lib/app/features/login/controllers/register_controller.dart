import 'dart:io';

import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';
import 'package:dev9lu_market_flutter/app/utils/services/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  final ImagePicker imagePicker = ImagePicker();
  File? imageFile;

  void register() async {
    final String name = nameCtrl.text;
    final String phone = phoneCtrl.text.trim();
    final String email = emailCtrl.text.trim();
    final String password = passwordCtrl.text.trim();
    final String confirmPass = confirmPassCtrl.text.trim();

    print(
        'Email: ${email}, pass: ${password}, Name: ${name}, phone: ${phone}, confirmPass: ${confirmPass}');

    if (isValidForm(name, phone, email, password, confirmPass)) {
      User user =
          User(email: email, name: name, phone: phone, password: password);
      final Response response = await usersProvider.create(user);

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

  Future selectImage(ImageSource imageSource) async {
    final XFile? image = await imagePicker.pickImage(source: imageSource);
    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }

  void showAlertDialog() {
    final galleryButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.gallery);
        },
        child: const Text('GALERIA'));
    final cameraButton = ElevatedButton(
        onPressed: () {
          Get.back();
          selectImage(ImageSource.camera);
        },
        child: const Text('CAMERA'));

    // final alterDialog = AlertDialog(
    //   title: const Text('Selecciona una opcion'),
    //   actions: [galleryButton, cameraButton],
    // );
    Get.defaultDialog(
        title: 'Selecciona una opcion', actions: [galleryButton, cameraButton]);

    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return alterDialog;
    //     });
  }
}

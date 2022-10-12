import 'dart:convert';
import 'dart:io';

import 'package:dev9lu_market_flutter/app/config/routes/app_pages.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/response_api.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';
import 'package:dev9lu_market_flutter/app/utils/services/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/completed.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

/* Logica Registro */
class RegisterController extends GetxController {
  /* Entradas de usuario */
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();

  /* Instancia de nuestro proveedor de DATA */
  UsersProvider usersProvider = UsersProvider();
  /* Instancia de Seleccionador de Imagen */
  final ImagePicker imagePicker = ImagePicker();
  /* Ruta en el sistema de archivos */
  File? imageFile;

  void register(BuildContext context) async {
    /* Controlador Campos de texto */
    final String name = nameCtrl.text;
    final String phone = phoneCtrl.text.trim();
    final String email = emailCtrl.text.trim();
    final String password = passwordCtrl.text.trim();
    final String confirmPass = confirmPassCtrl.text.trim();

    if (isValidForm(name, phone, email, password, confirmPass)) {
      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(
          progressType: ProgressType.valuable,
          max: 100,
          msg: 'Registrando datos...',
          completed: Completed(
            completedMsg: 'Registro Completo',
            completedImage: AssetImage('assets/images/delivery01.png'),
            closedDelay: 5000,
          ));

      final user = User(
        email: email,
        name: name,
        phone: phone,
        password: password,
      );
      /* Enviamos la solicitud a nuestro proveedor de datos */
      final Stream stream = await usersProvider.createUserWithImage(
        user,
        imageFile!,
      );
      /* Cuando la respuesta del server este completada muestra los resultados */
      stream.listen((res) async {
        final ResponseApi responseApi = ResponseApi.fromMap(json.decode(res));

        if (responseApi.success == true) {
          progressDialog.update(value: 100);
          await Future.delayed(const Duration(milliseconds: 2000));
          /* Guardamos los datos de usuario */
          GetStorage().write('user', responseApi.data);
          /* Redirigimos al usuario a la pantalla conrrespondiente del numero de roles */
          User myUser = User.fromJson(GetStorage().read('user') ?? {});
          myUser.roles!.length > 1 ? goToRolesPage() : goToClientProductPage();
        } else {
          progressDialog.close();
          Get.snackbar('Registro fallido', responseApi.message ?? '');
        }
      });
    }
  }

/* Validaciones de Campos de texto - Notifica al usuario que campos debe incluir o esta mal */
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

    if (imageFile == null) {
      Get.snackbar(
          'Formulario no valido', 'Debes seleccionar una imagen de perfil');
      return false;
    }

    return true;
  }

  /* Cambiar a vista Arrastrable de Login */
  void goToLoginSheet(BuildContext context, Widget child) {
    Get.back();
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) => child);
  }

  /* Seleccionador de Imagen */
  Future selectImage(ImageSource imageSource) async {
    /* Abstraccion de archivos simplificada y multipataforma */
    final XFile? image =
        await imagePicker.pickImage(source: imageSource, imageQuality: 5);
    if (image != null) {
      imageFile = File(image.path);
      /* Actualizacion de la vista */
      update();
    }
  }

  /* Galeria o Camara? */
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
    /* Mostrar Opciones */
    Get.defaultDialog(
        title: 'Selecciona una opcion', actions: [galleryButton, cameraButton]);

    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return alterDialog;
    //     });
  }

/* Ir a vista de Lista de Productos */
  void goToClientProductPage() {
    Get.offNamedUntil(Routes.clientProductsList, (route) => false);
  }

/* Ir a vista de Roles */
  void goToRolesPage() {
    Get.offNamedUntil(Routes.roles, (route) => false);
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:dev9lu_market_flutter/app/config/routes/app_pages.dart';
import 'package:dev9lu_market_flutter/app/features/client/controllers/client_profile_info_controller.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/response_api.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';
import 'package:dev9lu_market_flutter/app/utils/services/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class ClientProfileUpdateController extends GetxController {
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  File? imageFile;

  User user = User.fromJson(GetStorage().read('user'));

  final ImagePicker imagePicker = ImagePicker();
  UsersProvider usersProvider = UsersProvider();

  ClientProfileInfoController clientProfileInfoController = Get.find();

  ClientProfileUpdateController() {
    nameCtrl.text = user.name ?? '';
    phoneCtrl.text = user.phone ?? '';
  }

  void goToUpdatePage() {
    Get.offNamedUntil(Routes.update, (route) => false);
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

  Future selectImage(ImageSource imageSource) async {
    final XFile? image =
        await imagePicker.pickImage(source: imageSource, imageQuality: 5);
    if (image != null) {
      imageFile = File(image.path);
      update();
    }
  }

  bool isValidForm(String name, String phone) {
    // Validate data
    if (name.isEmpty || phone.isEmpty) {
      Get.snackbar('Formulario no valido', 'Ingresa todos los datos');
      return false;
    }
    return true;
  }

  void updateClient(BuildContext context) async {
    final String name = nameCtrl.text;
    final String phone = phoneCtrl.text.trim();

    if (isValidForm(name, phone)) {
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

      final myUser = User(
        name: name,
        id: user.id,
        phone: phone,
        sessionToken: user.sessionToken,
      );

      if (imageFile == null) {
        ResponseApi responseApi = await usersProvider.update(myUser);
        Get.snackbar('Proceso terminado', responseApi.message ?? '');
        progressDialog.close();
        if (responseApi.success == true) {
          // Asignacion a usuario de sesion

          GetStorage().write('user', responseApi.data);
          clientProfileInfoController.user.value =
              User.fromJson(GetStorage().read('user') ?? {});
          // ------------------------------x---------------------//
          print('Respose APi Update: ${responseApi.data}');
        }
      } else {
        // actulizar con imagen
        Stream stream =
            await usersProvider.updateUserWithImage(user, imageFile!);
        stream.listen((res) {
          progressDialog.close();
          ResponseApi responseApi = ResponseApi.fromMap(json.decode(res));
          Get.snackbar('Proceso terminado', responseApi.message ?? '');
          print('Respose APi Update: ${responseApi.data}');

          if (responseApi.success == true) {
            // Asignacion a usuario de sesion

            GetStorage().write('user', responseApi.data);
            clientProfileInfoController.user.value =
                User.fromJson(GetStorage().read('user') ?? {});
          } else {
            progressDialog.close();
            Get.snackbar('Registro fallido', responseApi.message ?? '');
          }
        });
      }

      // final Stream stream =
      //     await usersProvider.createUserWithImage(user, imageFile!);
      // stream.listen((res) async {
      //   final ResponseApi responseApi = ResponseApi.fromMap(json.decode(res));

      //   if (responseApi.success == true) {
      //     progressDialog.update(value: 100);
      //     await Future.delayed(const Duration(milliseconds: 2000));
      //     GetStorage().write('user', responseApi.data);

      //     User myUser = User.fromJson(GetStorage().read('user') ?? {});
      //     myUser.roles!.length > 1 ? goToRolesPage() : goToClientProductPage();
      //   } else {
      //     progressDialog.close();
      //     Get.snackbar('Registro fallido', responseApi.message ?? '');
      //   }
      // });
    }
  }
}

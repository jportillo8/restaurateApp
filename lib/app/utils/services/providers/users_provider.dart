import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

import 'package:get/get.dart';

import 'package:dev9lu_market_flutter/app/constants/app_constants.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/response_api.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';

class UsersProvider extends GetConnect {
  String url = '${ApiPath.API_URL}/users/create';
  String urlLogin = '${ApiPath.API_URL}/users/login';
  String urlRegister = '${ApiPath.API_URL}/users/createWithImage';

  Future<Response> create(User user) async {
    Response response = await post(url, user.toJson(),
        headers: {'Content-Type': 'application/json'});
    return response;
  }

  Future<ResponseApi> login(String email, String password) async {
    final Response response = await post(
        urlLogin, {'email': email, 'password': password},
        headers: {'Content-Type': 'application/json'});

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la peticion');
      return ResponseApi();
    }
    final ResponseApi responseApi = ResponseApi.fromMap(response.body);
    return responseApi;
  }

  Future<ResponseApi> createUserWithImage(User user, File image) async {
    final FormData form = FormData({
      'image': MultipartFile(image, filename: basename(image.path)),
      'user': json.encode(user)
    });

    final Response response = await post(urlRegister, form);
    print(response.body);
    print(form.fields);
    print(response.hasError);
    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la peticion');
      return ResponseApi();
    }
    final ResponseApi responseApi = ResponseApi.fromMap(response.body);
    return responseApi;
  }
}

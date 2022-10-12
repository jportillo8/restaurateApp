import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' show basename;

import 'package:get/get.dart';

import 'package:dev9lu_market_flutter/app/constants/app_constants.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/response_api.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';

class UsersProvider extends GetConnect {
  String url = '${ApiPath.API_URL}/users/create';
  String urlLogin = '${ApiPath.API_URL}/users/login';
  String urlUpdate = '${ApiPath.API_URL}/users/updateWithoutImage';
  String urlRegister = '${ApiPath.API_URL}/users/createWithImage';

  Future<Response> create(User user) async {
    Response response = await post(url, user.toJson(),
        headers: {'Content-Type': 'application/json'});
    return response;
  }

/*--------------------------LOGIN------------------------------------*/
  Future<ResponseApi> login(String email, String password) async {
    final data = {
      'email': email,
      'password': password,
    };

    final Response response = await post(
      urlLogin,
      data,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.body == null) {
      Get.snackbar(
        'Error',
        'No se pudo ejecutar la peticion, es posible que el servidor este caido',
      );
      /* Responde si el server esta fuera de linea o tiene algun error*/
      return ResponseApi();
    }
    final ResponseApi responseApi = ResponseApi.fromMap(response.body);
    /* Respuesta del server */
    return responseApi;
  }

/*----------------------REGISTRO USUARIO CON IMAGEN----------------------*/
  Future<Stream> createUserWithImage(User user, File image) async {
    final Uri uri = Uri.http(ApiPath.API_URL_OLD, '/api/users/createWithImage');
    /* Solicitud de datos de formulario/varias partes */
    final request = http.MultipartRequest('POST', uri);

    /* Lista de archivos para cargar para esta solicitud */
    request.files.add(
      http.MultipartFile(
        'image',
        http.ByteStream(image.openRead().cast()),
        await image.length(),
        filename: basename(image.path),
      ),
    );

    request.fields['user'] = json.encode(user);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }

  // Future<ResponseApi> createUserWithImageGetx(User user, File image) async {
  //   final FormData form = FormData({
  //     'image': MultipartFile(image, filename: basename(image.path)),
  //     'user': json.encode(user)
  //   });

  //   final Response response = await post(urlRegister, form);
  //   if (response.body == null) {
  //     Get.snackbar('Error', 'No se pudo ejecutar la peticion');
  //     return ResponseApi();
  //   }
  //   final ResponseApi responseApi = ResponseApi.fromMap(response.body);
  //   return responseApi;
  // } //ImageQuality in 5

  //=================== UPDATE =======================

  // Datos sin imagen
  Future<ResponseApi> update(User user) async {
    Response response = await put(urlUpdate, user.toJson(),
        headers: {'Content-Type': 'application/json'});
    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo actualizar el usuario');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromMap(response.body);
    return responseApi;
  }

// Datos con imagen
  Future<Stream> updateUserWithImage(User user, File image) async {
    final Uri uri = Uri.http(ApiPath.API_URL_OLD, '/api/users/update');
    final request = http.MultipartRequest('PUT', uri);
    request.files.add(http.MultipartFile(
        'image', http.ByteStream(image.openRead().cast()), await image.length(),
        filename: basename(image.path)));

    request.fields['user'] = json.encode(user);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }
}

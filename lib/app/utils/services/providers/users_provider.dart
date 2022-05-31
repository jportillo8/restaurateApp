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

  Future<Stream> createUserWithImage(User user, File image) async {
    final Uri uri = Uri.http(ApiPath.API_URL_OLD, '/api/users/createWithImage');
    final request = http.MultipartRequest('POST', uri);
    request.files.add(http.MultipartFile(
        'image', http.ByteStream(image.openRead().cast()), await image.length(),
        filename: basename(image.path)));

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
}

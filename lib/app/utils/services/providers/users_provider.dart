import 'package:get/get.dart';

import 'package:dev9lu_market_flutter/app/constants/app_constants.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/response_api.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';

class UsersProvider extends GetConnect {
  String url = '${ApiPath.API_URL}/users/create';
  String urlLogin = '${ApiPath.API_URL}/users/login';

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
}

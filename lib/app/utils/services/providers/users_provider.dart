import 'package:dev9lu_market_flutter/app/constants/app_constants.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';
import 'package:get/get.dart';

class UsersProvider extends GetConnect {
  String url = '${ApiPath.API_URL}/users/create';

  Future<Response> create(User user) async {
    Response response = await post(url, user.toJson(),
        headers: {'Content-Type': 'application/json'});
    return response;
  }
}

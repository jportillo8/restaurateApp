import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RolesController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});
}

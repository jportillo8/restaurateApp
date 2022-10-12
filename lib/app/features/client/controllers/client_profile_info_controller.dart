import 'package:dev9lu_market_flutter/app/config/routes/app_pages.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClientProfileInfoController extends GetxController {
  var user = User.fromJson(GetStorage().read('user')).obs;

  void logout() async {
    final userData = GetStorage();
    userData.remove('user');
    print('Usuario de el controller ${user.value.id}');
    goToLoginPage();
  }

  void goToLoginPage() {
    Get.offNamedUntil(Routes.login, (route) => false);
  }

  void goToUpdatePage() {
    Get.toNamed(Routes.update);
  }
}

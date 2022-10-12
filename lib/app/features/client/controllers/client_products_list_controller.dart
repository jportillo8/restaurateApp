import 'package:dev9lu_market_flutter/app/config/routes/app_pages.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClientProductsListController extends GetxController {
  User user = User.fromJson(GetStorage().read('user') ?? {});

  var indexTab = 0.obs;

  void changeTab(int index) {
    this.indexTab.value = index;
  }

  void logout() async {
    final userData = GetStorage();
    userData.remove('user');
    goToLoginPage();
  }

  void goToLoginPage() {
    Get.offNamedUntil(Routes.login, (route) => false);
  }
}

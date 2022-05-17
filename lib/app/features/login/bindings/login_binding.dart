import 'package:dev9lu_market_flutter/app/features/login/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:dev9lu_market_flutter/app/features/login/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}

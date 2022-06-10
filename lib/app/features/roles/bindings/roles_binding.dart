import 'package:dev9lu_market_flutter/app/features/roles/controllers/roles_controller.dart';
import 'package:get/get.dart';

class RolesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RolesController>(() => RolesController());
  }
}

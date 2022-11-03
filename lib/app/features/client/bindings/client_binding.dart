import 'package:dev9lu_market_flutter/app/features/client/controllers/client_home_controller.dart';
import 'package:dev9lu_market_flutter/app/features/client/controllers/client_pofile_update_controller.dart';
import 'package:dev9lu_market_flutter/app/features/client/controllers/client_products_list_controller.dart';
import 'package:dev9lu_market_flutter/app/features/client/controllers/client_profile_info_controller.dart';
import 'package:get/get.dart';

class ClientBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientHomeController>(() => ClientHomeController());
    Get.lazyPut<ClientProductsListController>(
        () => ClientProductsListController());
    Get.lazyPut<ClientProfileInfoController>(
        () => ClientProfileInfoController());
    Get.lazyPut<ClientProfileUpdateController>(
        () => ClientProfileUpdateController());
  }
}

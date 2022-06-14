import 'package:dev9lu_market_flutter/app/features/client/controllers/client_products_list_controller.dart';
import 'package:get/get.dart';

class ClientBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientProductsListController>(
        () => ClientProductsListController());
  }
}

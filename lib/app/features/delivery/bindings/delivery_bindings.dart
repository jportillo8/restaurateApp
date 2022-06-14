import 'package:dev9lu_market_flutter/app/features/delivery/controllers/delivery_orders_list_controller.dart';
import 'package:get/get.dart';

class DeliveryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveryOrdersListController>(
        () => DeliveryOrdersListController());
  }
}

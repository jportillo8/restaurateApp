import 'package:dev9lu_market_flutter/app/features/restaurant/controllers/restaurant_orders_list_controller.dart';
import 'package:get/get.dart';

class RestaurantBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantOrdersListController>(
        () => RestaurantOrdersListController());
  }
}

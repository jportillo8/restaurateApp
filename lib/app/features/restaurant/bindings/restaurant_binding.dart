import 'package:dev9lu_market_flutter/app/features/client/controllers/client_profile_info_controller.dart';
import 'package:dev9lu_market_flutter/app/features/restaurant/controllers/restaurant_categories_create_controller.dart';
import 'package:dev9lu_market_flutter/app/features/restaurant/controllers/restaurant_home_controller.dart';
import 'package:dev9lu_market_flutter/app/features/restaurant/controllers/restaurant_orders_list_controller.dart';
import 'package:get/get.dart';

class RestaurantBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantOrdersListController>(
        () => RestaurantOrdersListController());
    Get.lazyPut<RestaurantHomeController>(() => RestaurantHomeController());
    Get.lazyPut<ClientProfileInfoController>(
        () => ClientProfileInfoController());
    Get.lazyPut<RestaurantCategoriesCreateController>(
        () => RestaurantCategoriesCreateController());
  }
}

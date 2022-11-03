import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class RestaurantCategoriesCreateController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var isOpen = false.obs;
  late AnimationController animationController;

  @override
  void onInit() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.onInit();
  }
}

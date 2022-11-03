import 'package:dev9lu_market_flutter/app/features/restaurant/controllers/restaurant_categories_create_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RestaurantCategoriesCreatePage
    extends GetView<RestaurantCategoriesCreateController> {
  const RestaurantCategoriesCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Obx(() => GestureDetector(
              onTap: () {
                controller.isOpen.value = !controller.isOpen.value;
                controller.isOpen.value
                    ? controller.animationController.forward()
                    : controller.animationController.reverse();
              },
              child: Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 50,
                width: 200,
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: controller.isOpen.value ? 30 : 0,
                      ),
                      Text(
                        'Agregar categoria',
                        style: TextStyle(fontSize: 15),
                      ),
                      Spacer(),
                      AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          progress: controller.animationController)
                    ]),
              ),
            )),
        body: Center(
          child: Text('RESTATURANT CATEGORIES CREATE PAGE'),
        ),
      ),
    );
  }
}

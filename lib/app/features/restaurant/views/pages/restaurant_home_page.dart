import 'package:dev9lu_market_flutter/app/features/client/controllers/client_home_controller.dart';
import 'package:dev9lu_market_flutter/app/features/client/controllers/client_products_list_controller.dart';
import 'package:dev9lu_market_flutter/app/features/client/views/pages/client_profile_info_page.dart';
import 'package:dev9lu_market_flutter/app/features/delivery/views/pages/delivery_orders_list_page.dart';
import 'package:dev9lu_market_flutter/app/features/restaurant/controllers/restaurant_home_controller.dart';
import 'package:dev9lu_market_flutter/app/features/restaurant/views/pages/restaurant_categories_create_page.dart';
import 'package:dev9lu_market_flutter/app/features/restaurant/views/pages/restaurant_orders_list_page.dart';
import 'package:dev9lu_market_flutter/app/utils/ui/custom_animated_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RestaurantHomePage extends GetView<RestaurantHomeController> {
  const RestaurantHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
            // bottomNavigationBar: _bottomBar(),
            body: Stack(
          children: [
            IndexedStack(
              index: controller.indexTab.value,
              children: [
                RestaurantOrdersListPage(),
                RestaurantCategoriesCreatePage(),
                DeliveryOrdersListPage(),
                ClientProfileInfoPage(),
              ],
            ),
            Positioned(
              bottom: -10,
              child: Container(
                  height: 100,
                  width: Get.width,
                  child: true ? _bottomBar() : Container(height: 0)),
            )
          ],
        )));

    // Scaffold(
    //     bottomNavigationBar: Obx(() => _bottomBar()),
    //     body: Obx(() => IndexedStack(
    //           index: controller.indexTab.value,
    //           children: [
    //             RestaurantOrdersListPage(),
    //             DeliveryOrdersListPage(),
    //             HomePage()
    //           ],
    //         )));
  }

  Widget _bottomBar() {
    return CustomAnimatedBottomBar(
      // containerHeight: 50,
      backgroundColor: Colors.black87,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      selectedIndex: controller.indexTab.value,
      onItemSelected: (index) => controller.changeTab(index),
      items: [
        BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.adn),
            title: Text('Home'),
            activeColor: Colors.white,
            inactiveColor: Colors.red),
        BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.carBattery),
            title: Text('Categories'),
            activeColor: Colors.white,
            inactiveColor: Colors.red),
        BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.listCheck),
            title: Text('Mis pedidos'),
            activeColor: Colors.white,
            inactiveColor: Colors.red),
        BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.userAstronaut),
            title: Text('Perfil'),
            activeColor: Colors.white,
            inactiveColor: Colors.red)
      ],
    );
  }
}


// TODO Actualizar
// Obx(() => Scaffold(
//         bottomNavigationBar: _bottomBar(),
//         body: Stack(
//           children: [
//             IndexedStack(
//               index: controller.indexTab.value,
//               children: [
//                 RestaurantOrdersListPage(),
//                 DeliveryOrdersListPage(),
//                 HomePage()
//               ],
//             ),
//             Positioned(
//               bottom: 30,
//               child: Container(height: 100, width: 300, child: _bottomBar()),
//             )
//           ],
//         )));

// return Obx(() => Scaffold(
//         bottomNavigationBar: _bottomBar(),
//         body: IndexedStack(
//           index: controller.indexTab.value,
//           children: [
//             RestaurantOrdersListPage(),
//             DeliveryOrdersListPage(),
//             ClientProfileInfoPage()
//           ],
//         )));
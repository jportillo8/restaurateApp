import 'package:dev9lu_market_flutter/app/features/client/controllers/client_home_controller.dart';
import 'package:dev9lu_market_flutter/app/features/client/controllers/client_products_list_controller.dart';
import 'package:dev9lu_market_flutter/app/features/client/views/pages/client_products_list_page.dart';
import 'package:dev9lu_market_flutter/app/features/client/views/pages/client_profile_info_page.dart';
import 'package:dev9lu_market_flutter/app/features/delivery/views/pages/delivery_orders_list_page.dart';
import 'package:dev9lu_market_flutter/app/features/restaurant/views/pages/restaurant_orders_list_page.dart';
import 'package:dev9lu_market_flutter/app/utils/ui/custom_animated_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ClientHomePage extends GetView<ClientHomeController> {
  const ClientHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
            // bottomNavigationBar: _bottomBar(),
            body: Stack(
          children: [
            IndexedStack(
              index: controller.indexTab.value,
              children: [
                ClientProductsListPage(),
                DeliveryOrdersListPage(),
                ClientProfileInfoPage()
              ],
            ),
            Positioned(
              bottom: 15,
              child:
                  Container(height: 100, width: Get.width, child: _bottomBar()),
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
      containerHeight: 80,
      backgroundColor: Colors.orangeAccent,
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
            inactiveColor: Colors.black),
        BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.listCheck),
            title: Text('Mis pedidos'),
            activeColor: Colors.white,
            inactiveColor: Colors.black),
        BottomNavyBarItem(
            icon: Icon(FontAwesomeIcons.userAstronaut),
            title: Text('Perfil'),
            activeColor: Colors.white,
            inactiveColor: Colors.black)
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
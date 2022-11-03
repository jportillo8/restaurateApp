import 'package:dev9lu_market_flutter/app/features/client/controllers/client_products_list_controller.dart';
import 'package:dev9lu_market_flutter/app/features/client/views/pages/client_profile_info_page.dart';
import 'package:dev9lu_market_flutter/app/features/delivery/views/pages/delivery_orders_list_page.dart';
import 'package:dev9lu_market_flutter/app/features/restaurant/views/pages/restaurant_orders_list_page.dart';
import 'package:dev9lu_market_flutter/app/utils/ui/custom_animated_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ClientProductsListPage extends GetView<ClientProductsListController> {
  const ClientProductsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('CLIENT PRODUCTS LIST PAGE'),
      ),
    );
  }
}

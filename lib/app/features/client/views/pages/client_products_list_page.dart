import 'package:dev9lu_market_flutter/app/features/client/controllers/client_products_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientProductsListPage extends GetView<ClientProductsListController> {
  const ClientProductsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Client Orders List'),
        MaterialButton(
            color: Colors.white,
            child: Text('Logout'),
            onPressed: () => controller.logout())
      ],
    );
  }
}

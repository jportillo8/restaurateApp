import 'package:dev9lu_market_flutter/app/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Container(
      color: Colors.amber,
      alignment: Alignment.center,
      child: Column(
        children: [
          const Text('Home PageX'),
          MaterialButton(
              color: Colors.white,
              child: Text('Logout'),
              onPressed: () => controller.logout())
        ],
      ),
    );
  }
}

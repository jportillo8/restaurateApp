import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dev9lu_market_flutter/app/config/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      title: 'Dev9lu Market',
      getPages: AppPages.routes,
    );
  }
}

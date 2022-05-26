import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dev9lu_market_flutter/app/config/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

User userSession = User.fromJson(GetStorage().read('user') ?? {}); // Borrar

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(userSession.id); //Borrar
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      title: 'Dev9lu Market',
      getPages: AppPages.routes,
    );
  }
}

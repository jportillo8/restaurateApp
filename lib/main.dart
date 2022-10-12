import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dev9lu_market_flutter/app/config/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

User userSession = User.fromJson(GetStorage().read('user') ?? {}); // Borrar

void main() async {
  /* Interactuar con el motor de flutter - Se asegura de tener una instancia de WidgetsBinding, 
    que se requiere para usar los canales de la plataforma, para llamar al código nativo */
  WidgetsFlutterBinding.ensureInitialized();
  /* Bloqueamos la orientacion horizontal con el objetivo de simplificar el trabajo */
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  /* local data */
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(' Id Usuario ${userSession.id}'); //Borrar
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      title: 'Dev9lu Market',
      getPages: AppPages.routes,
    );
  }
}

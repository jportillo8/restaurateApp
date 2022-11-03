import 'package:dev9lu_market_flutter/app/features/client/bindings/client_binding.dart';
import 'package:dev9lu_market_flutter/app/features/client/views/pages/client_home_page.dart';
import 'package:dev9lu_market_flutter/app/features/client/views/pages/client_profile_update_page.dart';
import 'package:dev9lu_market_flutter/app/features/delivery/bindings/delivery_bindings.dart';
import 'package:dev9lu_market_flutter/app/features/home/bindings/home_binding.dart';
import 'package:dev9lu_market_flutter/app/features/home/views/pages/home_page.dart';
import 'package:dev9lu_market_flutter/app/features/restaurant/views/pages/restaurant_home_page.dart';
import 'package:dev9lu_market_flutter/app/features/restaurant/views/pages/restaurant_orders_list_page.dart';
import 'package:dev9lu_market_flutter/app/features/roles/bindings/roles_binding.dart';
import 'package:dev9lu_market_flutter/app/features/roles/views/pages/roles_page.dart';
import 'package:dev9lu_market_flutter/app/utils/services/models/user.dart';
import 'package:get/get.dart';

import 'package:dev9lu_market_flutter/app/features/login/bindings/login_binding.dart';

import 'package:dev9lu_market_flutter/app/features/restaurant/bindings/restaurant_binding.dart';
import 'package:dev9lu_market_flutter/app/features/delivery/views/pages/delivery_orders_list_page.dart';
import 'package:dev9lu_market_flutter/app/features/client/views/pages/client_products_list_page.dart';
import 'package:dev9lu_market_flutter/app/features/authentication/views/pages/authentication_page.dart';
import 'package:dev9lu_market_flutter/app/features/login/views/pages/login_page.dart';
import 'package:dev9lu_market_flutter/app/features/registration/views/pages/registration_page.dart';
import 'package:dev9lu_market_flutter/app/features/splash/views/pages/splash_page.dart';
import 'package:get_storage/get_storage.dart';

part 'app_routes.dart';

/* Data de Usuario*/
User userSession = User.fromJson(GetStorage().read('user') ?? {});

abstract class AppPages {
  /* Navegacion condicional */
  static final initial = userSession.id != null
      ? userSession.roles!.length > 1
          ? Routes.roles
          : Routes.clientHome
      : Routes.login;

  /* Rutas de navegacion */
  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
        name: _Paths.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
      name: _Paths.registration,
      page: () => const RegistrationPage(),
    ),
    GetPage(
      name: _Paths.authentication,
      page: () => const AuthenticationPage(),
    ),
    GetPage(
        name: _Paths.home,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: _Paths.roles,
        page: () => const RolesPage(),
        binding: RolesBinding()),

    //Cliente
    GetPage(
        name: _Paths.clientHome,
        page: () => const ClientHomePage(),
        binding: ClientBinding()),

    GetPage(
        name: _Paths.clientProductsList,
        page: () => const ClientProductsListPage(),
        binding: ClientBinding()),

    GetPage(
        name: _Paths.deliveryOrdersList,
        page: () => const DeliveryOrdersListPage(),
        binding: DeliveryBinding()),
    //Restaurante
    GetPage(
        name: _Paths.restaurantHome,
        page: () => const RestaurantHomePage(),
        binding: RestaurantBinding()),
    GetPage(
        name: _Paths.restaurantOrdersList,
        page: () => const RestaurantOrdersListPage(),
        binding: RestaurantBinding()),
    //

    GetPage(
        name: _Paths.update,
        page: () => const ClientProfileUpdatePage(),
        binding: ClientBinding()),
  ];
}

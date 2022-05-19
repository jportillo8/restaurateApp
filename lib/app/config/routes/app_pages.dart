import 'package:get/get.dart';

import 'package:dev9lu_market_flutter/app/features/login/bindings/login_binding.dart';

import 'package:dev9lu_market_flutter/app/features/authentication/views/pages/authentication_page.dart';
import 'package:dev9lu_market_flutter/app/features/home/views/screens/home_page.dart';
import 'package:dev9lu_market_flutter/app/features/login/views/pages/login_page.dart';
import 'package:dev9lu_market_flutter/app/features/registration/views/pages/registration_page.dart';
import 'package:dev9lu_market_flutter/app/features/splash/views/pages/splash_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(name: _Paths.splash, page: () => const SplashPage()),
    GetPage(
        name: _Paths.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(name: _Paths.registration, page: () => const RegistrationPage()),
    GetPage(
        name: _Paths.authentication, page: () => const AuthenticationPage()),
    GetPage(name: _Paths.home, page: () => const HomePage()),
  ];
}
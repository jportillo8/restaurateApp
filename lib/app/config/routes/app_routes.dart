part of 'app_pages.dart';

/* Directorio de navegacion */
class Routes {
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const registration = _Paths.registration;
  static const authentication = _Paths.authentication;
  static const home = _Paths.home;
  static const roles = _Paths.roles;
  static const update = _Paths.update;

  //
  static const clientProductsList = _Paths.clientProductsList;
  static const deliveryOrdersList = _Paths.deliveryOrdersList;
  static const restaurantOrdersList = _Paths.restaurantOrdersList;
}

abstract class _Paths {
  static const splash = '/splash/';
  static const login = '/login/';
  static const registration = '/registration/';
  static const authentication = '/authentication/';
  static const home = '/home/';
  static const roles = '/roles/';
  static const update = '/update/';

  //
  static const clientProductsList = '/clientProductsList/';
  static const deliveryOrdersList = '/deliveryOrdersList/';
  static const restaurantOrdersList = '/restaurantOrdersList/';
}

part of 'app_pages.dart';

class Routes {
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const registration = _Paths.registration;
  static const authentication = _Paths.authentication;
  static const home = _Paths.home;
  static const roles = _Paths.roles;
}

abstract class _Paths {
  static const splash = '/splash/';
  static const login = '/login/';
  static const registration = '/registration/';
  static const authentication = '/authentication/';
  static const home = '/home/';
  static const roles = '/roles/';
}

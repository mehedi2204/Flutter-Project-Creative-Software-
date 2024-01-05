part of 'app_pages.dart';
abstract class Routes{
  Routes._();

  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const SIGNIN = _Paths.SIGNIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const DASHBOARD = _Paths.DASHBOARD;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASH = '/';
  static const SIGNIN = '/login';
  static const SIGNUP = '/home';
  static const DASHBOARD = '/dashboard';

}
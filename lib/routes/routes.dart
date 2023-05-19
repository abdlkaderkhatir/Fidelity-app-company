import 'package:fidelity_app/views/login_phone_screen.dart';
import 'package:fidelity_app/views/splash_screen.dart';
import 'package:get/get.dart';


class AppRoutes{

  static const splashRoute=Routes.splashScreen;
  static const initRoute=Routes.splashScreen;

  static final routes =[
    GetPage(name: Routes.splashScreen, page:()=>const SplashScreen()),
    GetPage(name: Routes.loginPhone, page:()=>const LoginPhoneScreen()),
  ];
}

class Routes{
  static const splashScreen = '/splash';
  static const loginPhone = '/loginphone';

}
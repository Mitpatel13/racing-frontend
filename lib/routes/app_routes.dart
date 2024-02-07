import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled/modules/bottom/bottombar_scr.dart';
import 'package:untitled/modules/splash/splash_scr.dart';

import '../modules/login/login_scr.dart';




class Routes {
  Routes._();

  static const String splashScr = '/splashScr';
  static const String bottomScr = '/bottomScr';
  static const String loginScreen = '/loginScreen';

}

class page {
  List<GetPage> pages = [
    GetPage(
      name: Routes.splashScr,
      page: () => SplashScr(),
    ),
    GetPage(
      name: Routes.bottomScr,
      page: () => BottomBarScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
    ),


  ];
}

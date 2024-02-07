import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:untitled/modules/home/home_ctrl.dart';
import 'package:untitled/modules/menu/menu_ctrl.dart';
import 'package:untitled/modules/otp/otp_ctrl.dart';
import 'package:untitled/modules/splash/ctrl/splash_ctrl.dart';
import 'package:untitled/modules/updateUser/update_user_ctrl.dart';

import '../modules/login/login_ctrl.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginCTRL());
    Get.put(HomeCTRL());// Initialize LoginCTRL here
    Get.put(OtpCTRL());// Initialize LoginCTRL here
    Get.put(SplashCTRL());// Initialize LoginCTRL here
    Get.put(UpdateCTRL());// Initialize LoginCTRL here
    // Get.put(MenuCTRL());// Initialize LoginCTRL here
  }
}
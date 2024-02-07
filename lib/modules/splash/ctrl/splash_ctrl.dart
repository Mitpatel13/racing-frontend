import 'dart:ffi';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/backend/prefs/user_prefs.dart';
import 'package:untitled/main.dart';
import 'package:untitled/modules/bottom/bottombar_scr.dart';
import 'package:untitled/modules/login/login_scr.dart';
 class SplashCTRL extends GetxController{
   @override
  void onInit() {
     // getUser();
    super.onInit();
  }
   getUser() async {
     bool  a = await UserPreferences.isLoggedIn();
     print('getting no from prefs $a');
     if (a == false) {
       Get.offAll(() => LoginScreen());
     } else {
       Get.offAll(() => BottomBarScreen());
     }
   }
 }
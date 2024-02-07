import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled/backend/prefs/user_prefs.dart';
import 'package:untitled/modules/menu/menu_ctrl.dart';
import 'package:untitled/modules/splash/ctrl/splash_ctrl.dart';
import 'package:untitled/modules/splash/splash_scr.dart';
class MenuScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MenuCTRL c = Get.put(MenuCTRL());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        // Wrap the widget that depends on the user variable with Obx
        return Column(
          children: [
            Text(c.user?.value?.data?.mobileNo ?? ""),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                LoginManager.logout();
                Get.offAll(() => SplashScr());
              },
            )
          ],
        );
      }),
    );
  }
}

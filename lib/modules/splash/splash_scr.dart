import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import 'ctrl/splash_ctrl.dart';
class SplashScr extends StatefulWidget {
  SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  final SplashCTRL c = Get.find<SplashCTRL>();
  @override
  void initState() {
    super.initState();
  c.getUser();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      Center(child: Image.asset('assets/splash_logo.png',height: 200,width: 200,))
    );
  }
}

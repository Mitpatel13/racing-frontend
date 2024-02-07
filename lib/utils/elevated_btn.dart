import 'package:flutter/material.dart';

import 'app_color.dart';
class MyElevatedBtn extends StatelessWidget {
   MyElevatedBtn({super.key, required this.text, this.onPressed});
  final String text;
   final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 10,
      child: ElevatedButton(
        onPressed:onPressed,
        child: Text(text, style: TextStyle(fontSize: 18)),
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColor.white,
          backgroundColor: AppColor.primaryColor,
          minimumSize: Size(MediaQuery.sizeOf(context).width/2, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled/modules/login/login_ctrl.dart';
import 'package:untitled/modules/otp/otp_scr.dart';
import 'package:untitled/utils/app_color.dart';
import 'package:untitled/utils/elevated_btn.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginCTRL c= Get.put(LoginCTRL());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(automaticallyImplyLeading: false,backgroundColor: Colors.transparent,),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/login_horse.png', fit: BoxFit.fill,height:100,width: 150,),
            const Text.rich(
              TextSpan(
                text: 'Hi,\n',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500,),
                children: [
                  TextSpan(
                    text: 'Let\'s get started!',
                    style: TextStyle(fontSize: 24,fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            // Text field with country code
            Row(
              children: [
                Container(
                  height: 60,width: 60,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black,),borderRadius: BorderRadius.circular(8)),
                    child: Center(child: Text('+91 ', style: TextStyle(fontSize: 20,color: Colors.grey)))),
                SizedBox(width: 10,),
                Form(
                  key: c.formkey,
                  child: Expanded(
                    child: TextFormField(
                      validator: c.validateMobile, // Link the validation function
                      // maxLength: 10,
                      controller: c.phonoCTRL,
                      decoration: InputDecoration(
                        hintText: 'Enter mobile number',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 48),
            // Continue button
            MyElevatedBtn(
              text: 'CONTINUE',
              onPressed: () {
                if (c.formkey.currentState!.validate()) {
                  // Form is valid, navigate to the next screen
                  Get.to(() => OtpScr());
                }
              },
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 18.0),
              child: Text.rich(
                TextSpan(
                  text: 'All rights reserved INDIA RACE FANTASY 2022\n',
                  style: TextStyle(fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'Powered by techraven.live',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),textAlign: TextAlign.center,
              ),
            )

          ],),
      ),

    );
  }
}

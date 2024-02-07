import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled/backend/prefs/user_prefs.dart';
import 'package:untitled/main.dart';
import 'package:untitled/modules/login/login_ctrl.dart';
import 'package:untitled/modules/otp/otp_ctrl.dart';
import 'package:untitled/utils/app_color.dart';

import '../../utils/elevated_btn.dart';
import '../bottom/bottombar_scr.dart';
class OtpScr extends StatelessWidget {
   OtpScr({super.key});
final c = Get.find<LoginCTRL>();
final OtpCTRL e = Get.find<OtpCTRL>();
  @override
  Widget build(BuildContext context) {
    print("OTP SCREEN${c.phonoCTRL.text}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: MediaQuery.sizeOf(context).height/6,),
          Image.asset('assets/login_horse.png', fit: BoxFit.fill,height:100,width: 150,),
          const Text.rich(
            TextSpan(
              text: 'Please enter the OTP sent to your,\n',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,),
              children: [
                TextSpan(
                  text: 'Mobile Number ',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          OtpTextField(
            numberOfFields: 4,
        
            disabledBorderColor: AppColor.primaryColor,
            borderColor: AppColor.black,
            showFieldAsBox: true,
            onCodeChanged: (String code) {
              if(code != '1234'){
                'Enter valid code';
              }
        
            },
            onSubmit: (String verificationCode){
              if(verificationCode != '1234'){
                showDialog(
                    context: context,
                    builder: (context){
                      return const AlertDialog(
                        title: Text("Invalid Verification Code"),
                        content: Text('Please enter correct code'),
                      );
                    }
                );
              }
              else{
                e.otp = verificationCode;
              }
        
            }, // end onSubmit
          ),
          SizedBox(height: 30,),
          MyElevatedBtn(text:'VERIFY',onPressed: (){
            // Get.offAll(()=>BottomBarScreen());
            if(e.otp == "1234"){
              c.signupUser(c.phonoCTRL.text).then((value) {
                LoginManager.login(value);

                Get.offAll(()=>BottomBarScreen());

              });

            }
        
        
          }, ),
          SizedBox(height: 30,),
          Text('Didn\'t receive an OTP ?',style: TextStyle(fontSize: 20),),
          SizedBox(height: 25,),
        
          Text(
            'Resend OTP',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
              fontSize: 23
            ),
          ),
          

        ],),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:untitled/modules/home/home_ctrl.dart';
import 'package:untitled/modules/login/login_ctrl.dart';
import 'package:untitled/modules/updateUser/update_user_ctrl.dart';
import 'package:untitled/utils/elevated_btn.dart';

import '../../model/usermodel.dart';
class UpdateUserScr extends StatelessWidget {
   UpdateUserScr({super.key});
   final LoginCTRL c = Get.find<LoginCTRL>();
   final UpdateCTRL e = Get.find<UpdateCTRL>();
   final HomeCTRL h = Get.find<HomeCTRL>();

  @override
  Widget build(BuildContext context) {
    Data? userModel = Get.arguments as Data?;
    e.phonectrl.text = userModel?.mobileNo ?? '';
    return Scaffold(
      appBar: AppBar(title: Text('Update Profile'),centerTitle: true,),
      body: Column(
        children: [
          Form(
            key:e.formkey,
            child:
          TextFormField(
            validator: e.validateMobile, // Link the validation function
            // maxLength: 10,
            controller: e.phonectrl,
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
          MyElevatedBtn(text: 'Update User',onPressed: (){

            if(e.formkey.currentState!.validate()){
              Map<String,dynamic> jsonBody = {
                'id':userModel?.id??"",
                'mobileNo':e.phonectrl.text.toString()
              };
              e.updateUser(jsonBody: jsonBody).then((value) {
                Get.back();
              });
            }

          },)
        ],
      ),

    );
  }
}

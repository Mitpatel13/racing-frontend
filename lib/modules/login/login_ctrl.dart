import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/backend/repo/user_repo.dart';
import 'package:untitled/model/usermodel.dart';

class LoginCTRL extends GetxController{
  final formkey = GlobalKey<FormState>();
  final TextEditingController phonoCTRL = TextEditingController();
  Future<UserModel> signupUser(String mobileNo) async {
    try {
      final res = await UserRepo().signUpUser(mobileNo);
      return res;

    } catch (e) {
      print('ERROR IN CTRL SINGUP $e');
      rethrow; // Rethrow the error to handle it in the calling code
    }
  }
  String mobilePattern = r'^[6-9]\d{9}$';

  bool isValidMobile(String? value) {
    if (value == null || value.isEmpty) {
      return false; // Mobile number is empty
    }

    RegExp regExp = RegExp(mobilePattern);
    return regExp.hasMatch(value);
  }

  String? validateMobile(String? value) {
    if (!isValidMobile(value)) {
      return 'Please enter a valid mobile number';
    }
    return null; // Return null if validation passes
  }

}
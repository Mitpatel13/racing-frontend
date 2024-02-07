import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/backend/prefs/user_prefs.dart';
import 'package:untitled/backend/repo/user_repo.dart';
import 'package:untitled/model/usermodel.dart';
import 'package:untitled/modules/home/home_ctrl.dart';
class UpdateCTRL extends GetxController {
  final HomeCTRL c = Get.find<HomeCTRL>();
  @override
  void onInit() {
    super.onInit();
    // getAdminId();
  }

  final formkey = GlobalKey<FormState>();
  final phonectrl = TextEditingController(text: ""); // Initialize with empty string
  UserModel? user = UserModel.fromJson({});

  Future<void> getAdminId() async {
    user = await UserPreferences.getUserInfo();
    print('user get from pref ${user?.toJson()}');
  }

  Future<void> updateUser({required Map<String,dynamic> jsonBody}) async {
    try {
     await getAdminId();
      final res = await UserRepo().updateUser(
        adminId: user?.data?.id ?? "",
        data: jsonBody,
      );
      await c.getAllUser();

      return res;
    } catch (e, t) {
      print('Error in update user $e');
      print('Trace in update user $t');
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
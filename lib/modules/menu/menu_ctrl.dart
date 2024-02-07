import 'package:get/get.dart';

import '../../backend/prefs/user_prefs.dart';
import '../../model/usermodel.dart';

class MenuCTRL extends GetxController {
  Rx<UserModel?> user = UserModel.fromJson({}).obs; // Declare user as an observable variable

  @override
  void onInit() {
    super.onInit();
    getAdminId();
  }

  Future<void> getAdminId() async {
    // You should set the value of the observable variable using `.value`
    user.value = await UserPreferences.getUserInfo();
  }
}

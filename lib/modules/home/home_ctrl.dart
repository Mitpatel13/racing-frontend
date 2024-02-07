import 'package:get/get.dart';
import 'package:untitled/backend/repo/user_repo.dart';

import '../../backend/prefs/user_prefs.dart';
import '../../model/usermodel.dart';

class HomeCTRL extends GetxController{
  RxBool isAdmin = false.obs;
  RxList<Data> userList = RxList<Data>([]);
  @override
  void onInit() {
    super.onInit();
    getAdminId();
  }

  UserModel user = UserModel.fromJson({});
  Future<void> getAdminId()async{
    user = (await UserPreferences.getUserInfo())!;
    isAdmin.value = user.data?.isAdmin??false;
    if(user.data?.isAdmin == true){
      getAllUser();
    }
    print(user.data?.isAdmin);
    print("isadminor not");

  }
  Future<void> deleteUser({required String userId, required String adminId}) async {
    try {
      await UserRepo().deleteUser(adminId: adminId, userId: userId);
      getAllUser();
    } catch (e, t) {
      print('Error in delete user $e');
      print('Trace in delete user $t');
    }
  }

  Future<List<Data>> getAllUser() async {
    try {
      var users =await UserRepo().getAllUser(adminId: user.data?.id ?? "");
      userList.assignAll(users);
      return userList;

    } catch (e, t) {
      print('Error in delete user $e');
      print('Trace in delete user $t');
      // Return an empty list in case of error
      return [];
    }
  }
}
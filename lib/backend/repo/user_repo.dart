import 'dart:io';

import 'package:dio/dio.dart';
import 'package:untitled/backend/api_routes.dart';
import 'package:untitled/backend/prefs/user_prefs.dart';
import 'package:untitled/model/usermodel.dart';

class UserRepo{
  final Dio dio = Dio();
  Future<UserModel> signUpUser(String mobileNo) async {
    try {
      print('${ApiRoutes.baseUrl}${ApiRoutes.register}');
      final res = await dio.post(
        '${ApiRoutes.baseUrl}${ApiRoutes.register}',
        data: {"mobileNo": mobileNo},
      );
      print('data get for api calling $mobileNo');
      print('data get for api calling ${res.data}');
      return UserModel.fromJson(res.data);
    } catch (e, t) {
      print('ERROR IN SIGN UP USER $e');
      print('TRACE IN SIGN UP USER $t');
      rethrow; // Rethrow the error to handle it in the calling code
    }
  }
  // Future<UserModel> signUserPost() async {
  //   try {
  //     String path = '${ApiRoutes.baseUrl}${ApiRoutes.register}';
  //     print(path);
  //     final response = await dio.get(path,);
  //     if(response.statusCode == 200){
  //       print(response);
  //     }
  //     UserModel user = UserModel.fromJson(response.data);
  //     UserPreferences.saveUserInfo(user);
  //     return user;
  //   } on DioException catch (e) {
  //     _handleError(e);
  //     rethrow;
  //   }
  // }
  Future<void> deleteUser({required String adminId,required String userId}) async {
    try {
      String path = '${ApiRoutes.baseUrl}/$adminId';
      print(path);
      final response = await dio.delete(path,data: {'id':userId});
      if(response.statusCode == 200){
        print(response);
      }
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }
  Future<void> updateUser({required String adminId,required dynamic data}) async {
    try {
      String path = '${ApiRoutes.baseUrl}/$adminId';
      print(path);
      final response = await dio.put(path,data: data);
      if(response.statusCode == 200){
        print(response);
      }
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }
  Future<List<Data>> getAllUser({required String adminId}) async {
    try {
      String path = '${ApiRoutes.baseUrl}/${ApiRoutes.allUser}';
      print(path);
      final response = await dio.get(path);
      if (response.statusCode == 200) {
        print(response);
        List<dynamic> userDataList = response.data['data'];
        List<Data> userList = userDataList.map((userData) => Data.fromJson(userData)).toList();
        return userList;
      } else {
        throw Exception('Failed to load user data');
      }
    } on DioError catch (e) {
      _handleError(e);
      throw e;
    }
  }
  void _handleError(DioException e) {
    String errorMessage = 'Request failed';
    if (e.response != null) {
      errorMessage = '${e.response!.statusCode}: ${e.response!.statusMessage}';
    } else if (e.error is SocketException) {
      errorMessage = 'No internet connection';
    }
    print(errorMessage);
  }
}
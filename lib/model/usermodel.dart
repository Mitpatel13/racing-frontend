// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? message;
  final Data? data;

  UserModel({
    this.message,
    this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final String? id;
  final String? mobileNo;
  final bool? isAdmin;
  final int? v;

  Data({
    this.id,
    this.mobileNo,
    this.isAdmin,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    mobileNo: json["mobileNo"],
    isAdmin: json["isAdmin"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "mobileNo": mobileNo,
    "isAdmin": isAdmin,
    "__v": v,
  };
}

import 'notifications/notification_model.dart';

class UserModel {
  String? type;
  String? message;
  Data? data;

  UserModel({this.type, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;
  String? userPoints;
  List<NotificationModel>? userNotification;

  Data(
      {this.userId,
        this.firstName,
        this.lastName,
        this.email,
        this.imageUrl,
        this.address,
        this.role,
        this.userPoints,
        this.userNotification});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
    userPoints = json['UserPoints'];
    if (json['UserNotification'] != null) {
      userNotification = <NotificationModel>[];
      json['UserNotification'].forEach((v) {
        userNotification!.add(NotificationModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['imageUrl'] = imageUrl;
    data['address'] = address;
    data['role'] = role;
    data['UserPoints'] = userPoints;
    if (userNotification != null) {
      data['UserNotification'] =
          userNotification!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}
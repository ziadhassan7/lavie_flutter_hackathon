import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/data/model/user/user_model.dart';
import '../../../presentation/provider/auth_provider.dart';
import '../../model/user/notifications/notification_model.dart';
import '../../repository/user_repository.dart';
import '../view_handler.dart';

class NotificationController {

  static Future<List<NotificationModel>> getNotifications (BuildContext context,) async {

    try {
      UserModel userModel = await UserRepository().getUser(AuthProvider.globalAuth, context);

      return userModel.data!.userNotification!;
    } on DioError catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }

  }
}
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/data/model/user/user_model.dart';

import '../../model/user/notifications/notification_model.dart';
import '../../repository/user_repository.dart';
import '../view_handler.dart';

class NotificationController {

  static Future<List<NotificationModel>> getNotifications (BuildContext context, String authKey) async {

    try {
      UserModel userModel = await UserRepository().getUser(authKey, context);

      return userModel.data!.userNotification!;
    } on DioError catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }

  }
}
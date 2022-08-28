import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/data/model/user/user_model.dart';
import 'package:la_vie_web/data/repository/user_repository.dart';
import '../../../presentation/provider/auth_provider.dart';
import '../view_handler.dart';

class ProfileController {


  static Future<UserModel> getUser(BuildContext context,) {

    try {
      return UserRepository().getUser(AuthProvider.globalAuth, context);
    } on DioError catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }

  }
}
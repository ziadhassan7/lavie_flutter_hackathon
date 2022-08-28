import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/data/model/forum/all_forums_model.dart';
import 'package:la_vie_web/data/model/forum/forum_model.dart';
import 'package:la_vie_web/data/repository/forum_repository.dart';
import '../../../presentation/provider/auth_provider.dart';
import '../view_handler.dart';

class ForumController {

  static Future<AllForumsModel> getAllForums(BuildContext context) {

    try {
      return ForumRepository().getForumAll(context, AuthProvider.globalAuth);
    } on DioError catch (e) {
      print("Authorization errroooooor");
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }
  }

  ///---------------------------------------------------------------------------
  static Future<AllForumsModel> getMyForums(BuildContext context) {

    try {
      return ForumRepository().getForumMy(context, AuthProvider.globalAuth);
    } on DioError catch (e) {
      print("Authorization errroooooor");
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }
  }

  ///---------------------------------------------------------------------------
  static Future<ForumModel> getOneForum(
      BuildContext context, {required String forumId}) {

    try {
      return ForumRepository().getForumOne(context, AuthProvider.globalAuth, forumId: forumId);
    } on DioError catch (e) {
      print("Authorization errroooooor");
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }
  }
}
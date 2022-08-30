import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/app_core/global_data.dart';
import 'package:la_vie_web/data/model/forum/all_forums_model.dart';
import 'package:la_vie_web/data/model/forum/forum_model.dart';
import 'package:la_vie_web/data/model/forum/like/like_model.dart';
import 'package:la_vie_web/data/repository/forum_repository.dart';
import '../view_handler.dart';

class ForumController {

  static TextEditingController titleController = TextEditingController();
  static TextEditingController bodyController = TextEditingController();


  static Future<AllForumsModel> getAllForums(BuildContext context) {

    try {
      return ForumRepository().getForumAll(context, GlobalData.globalAuth);
    } on DioError catch (e) {
      print("Authorization errroooooor");
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }
  }

  ///---------------------------------------------------------------------------
  static Future<AllForumsModel> getMyForums(BuildContext context) {

    try {
      return ForumRepository().getForumMy(context, GlobalData.globalAuth);
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
      return ForumRepository().getForumOne(context, GlobalData.globalAuth, forumId: forumId);
    } on DioError catch (e) {
      print("Authorization errroooooor");
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }
  }

  ///---------------------------------------------------------------------------
  static void postForum (BuildContext context, {
    required String image,
  }) {

    try {
      //post request
      ForumRepository().postForum(context,
          GlobalData.globalAuth,
          title: titleController.text,
          body: bodyController.text,
          image: image);

      //clear textFields
      titleController.clear();
      bodyController.clear();

    } on DioError catch (e) {
      print("Authorization errroooooor");
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }
  }

  ///---------------------------------------------------------------------------
  static Future<bool> postLike (BuildContext context, forumId) async {

    bool isLiked = false;

    try{
      LikeModel model = await ForumRepository()
          .postLike(context, GlobalData.globalAuth, forumId: forumId);

      if (model.message!.contains("created")) {
        isLiked = true;
      } else {
        isLiked = false;
      }

      return isLiked;

    } catch (e) {
      return isLiked; //false
    }
  }

  ///---------------------------------------------------------------------------
  static void postComment (BuildContext context, forumId, {
    required String text,
  }) {

    try {
      //post request
      ForumRepository().postComment(context,
          GlobalData.globalAuth,
          forumId: forumId,
          comment: text);

    } on DioError catch (e) {
      print("Authorization errroooooor");
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }
  }
}
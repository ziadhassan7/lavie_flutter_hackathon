import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/view_handler.dart';
import 'package:la_vie_web/data/model/forum/all_forums_model.dart';
import 'package:la_vie_web/data/model/forum/forum_model.dart';

import '../../business/dio_client.dart';

class ForumRepository {
  DioClient dio = DioClient();
  final endpoint = "/api/v1/forums";


  /// Get All Forums
  Future<AllForumsModel> getForumAll(BuildContext context, String token,) async {

    try {
      Response response = await dio.get(
          endpoint,
          options: Options(
              headers: {"Authorization": "Bearer $token"})
      );

      return AllForumsModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }

  /// Get My Forums
  Future<AllForumsModel> getForumMy(BuildContext context, String token,) async {

    try {
      Response response = await dio.get(
          "$endpoint/me",
          options: Options(
              headers: {"Authorization": "Bearer $token"})
      );

      return AllForumsModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }

  /// Get One Forum
  Future<ForumModel> getForumOne(BuildContext context, String token,
      {required String forumId}) async {

    try {
      Response response = await dio.get(
          "$endpoint/$forumId",
          options: Options(
              headers: {"Authorization": "Bearer $token"})
      );

      return ForumModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }
}
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/view_handler.dart';
import 'package:la_vie_web/data/model/forum/all_forums_model.dart';
import 'package:la_vie_web/data/model/forum/forum_model.dart';
import 'package:la_vie_web/data/model/forum/post_forum_model.dart';
import 'package:la_vie_web/data/model/forum/like/like_model.dart';
import '../../business/dio_client.dart';
import '../model/forum/comment/comment_model.dart';
import '../model/forum/comment/post_comment.dart';

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

  /// Post A Forum
  Future<ForumModel> postForum(
      BuildContext context,
      String token,{
        required String title,
        required String body,
        required String image,
      }) async {

    try {
      Response response = await dio.post(
          endpoint,
          options: Options(
              headers: {"Authorization": "Bearer $token"}),

          data: PostForum(
            title: title,
            description: body,
            imageBase64: image,
          ).toJson(),
      );

      return ForumModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }


  /// Like
  Future<LikeModel> postLike(
      BuildContext context,
      String token,
      {required String forumId}) async {

    try {
      Response response = await dio.post(
        "$endpoint/$forumId/like",
        options: Options(
            headers: {"Authorization": "Bearer $token"}),
      );

      return LikeModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }

  /// Comment
  Future<CommentModel> postComment(
      BuildContext context,
      String token,{
        required String forumId,
        required String comment,
      }) async {

    try {
      Response response = await dio.post(
        "$endpoint/$forumId/comment",
        options: Options(
            headers: {"Authorization": "Bearer $token"}),

        data: PostComment(
          comment: comment
        ).toJson(),
      );

      return CommentModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }
}
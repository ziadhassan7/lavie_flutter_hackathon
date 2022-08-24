import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/data/model/blogs/all_blogs_model.dart';

import '../../business/dio_client.dart';
import '../../business/dio_exception.dart';
import '../controller/view_handler.dart';
import '../model/blogs/blog_model.dart';

class BlogRepository {

  DioClient dio = DioClient();
  final endpoint = "/api/v1/products/blogs";


  /// Get One Blog
  Future<BlogModel> getBlogOne(String token, BuildContext context,
      {required String blogId}) async {

    try {
      Response response = await dio.get(
          "$endpoint/$blogId",
          options: Options(
              headers: {"Authorization": "Bearer $token"})
      );

      return BlogModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }

  /// Get All Blogs
  Future<AllBlogsModel> getBlogs(String token, BuildContext context) async {

    try {
      Response response = await dio.get(
          endpoint,
          options: Options(
              headers: {"Authorization": "Bearer $token"})
      );

      return AllBlogsModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }
}
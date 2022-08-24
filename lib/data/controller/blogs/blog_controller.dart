import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/data/model/blogs/all_blogs_model.dart';
import 'package:la_vie_web/data/model/blogs/blog_model.dart';
import 'package:la_vie_web/data/repository/blog_repository.dart';
import '../view_handler.dart';

class BlogController {

  static Future<AllBlogsModel> getAllBlogs(BuildContext context, String authKey) {

    try {
      return BlogRepository().getBlogs(authKey, context);
    } on DioError catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }

  }

  static Future<BlogModel> getOneBlog(BuildContext context, String authKey, blogId) {

    try {
      return BlogRepository().getBlogOne(authKey, context, blogId: blogId);
    } on DioError catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }

  }
}
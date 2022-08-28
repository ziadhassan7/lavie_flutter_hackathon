import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/data/model/blogs/all_blogs_model.dart';
import 'package:la_vie_web/data/model/blogs/blog_model.dart';
import 'package:la_vie_web/data/repository/blog_repository.dart';
import '../../../presentation/provider/auth_provider.dart';
import '../view_handler.dart';

class BlogController {

  static Future<AllBlogsModel> getAllBlogs(BuildContext context) {

    try {
      return BlogRepository().getBlogs(AuthProvider.globalAuth, context);
    } on DioError catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }

  }

  static Future<BlogModel> getOneBlog(BuildContext context, blogId) {

    try {
      return BlogRepository().getBlogOne(AuthProvider.globalAuth, context, blogId: blogId);
    } on DioError catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }

  }
}
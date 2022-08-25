import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/data/model/user/user_model.dart';

import '../../business/dio_client.dart';
import '../controller/view_handler.dart';

class UserRepository {

  DioClient dio = DioClient();
  final endpoint = "/api/v1/user/me";


  /// Get User info
  Future<UserModel> getUser(String token, BuildContext context) async {

    try {
      Response response = await dio.get(
          endpoint,
          options: Options(
              headers: {"Authorization": "Bearer $token"})
      );

      return UserModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }
}
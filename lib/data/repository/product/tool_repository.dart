import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:la_vie_web/business/dio_client.dart';
import 'package:la_vie_web/business/dio_exception.dart';
import '../../controller/view_handler.dart';
import '../../model/products/tool_model/all_tool_model.dart';
import '../../model/products/tool_model/tool_model.dart';


class ToolRepository{
  DioClient dio = DioClient();
  final endpoint = "/api/v1/tools";


  /// Get One Tool
  Future<ToolModel> getToolOne(BuildContext context, String token,
      {required String productId}) async {

    try {
      Response response = await dio.get(
        "$endpoint/$productId",
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );
      return ToolModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }

  /// Get All Tools
  Future<AllToolModel> getTools(BuildContext context, String token) async {

    try {
      Response response = await dio.get(
        endpoint,
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );
      return AllToolModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }
}
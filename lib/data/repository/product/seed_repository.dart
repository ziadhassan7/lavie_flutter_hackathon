import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:la_vie_web/business/dio_client.dart';
import 'package:la_vie_web/business/dio_exception.dart';
import '../../controller/view_handler.dart';
import '../../model/products/seed_model/all_seed_model.dart';
import '../../model/products/seed_model/seed_model.dart';


class SeedRepository{
  DioClient dio = DioClient();
  final endpoint = "/api/v1/seeds";


  /// Get One Seed
  Future<SeedModel> getSeedOne(BuildContext context, String token,
      {required String productId}) async {

    try {
      Response response = await dio.get(
        "$endpoint/$productId",
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );
      return SeedModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }

  /// Get All Seeds
  Future<AllSeedModel> getSeeds(BuildContext context, String token) async {

    try {
      Response response = await dio.get(
        endpoint,
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );
      return AllSeedModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }

}
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/business/dio_client.dart';
import 'package:la_vie_web/business/dio_exception.dart';
import '../../controller/view_handler.dart';
import '../../model/products/plant_model/all_plant_model.dart';
import '../../model/products/plant_model/plant_model.dart';


class PlantRepository{
  DioClient dio = DioClient();
  final endpoint = "/api/v1/plants";


  /// Get One Plant
  Future<PlantModel> getPlantOne(BuildContext context, String token,
      {required String productId}) async {

    try {
      Response response = await dio.get(
        "$endpoint/$productId",
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );
      return PlantModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }

  /// Get All Plants
  Future<AllPlantModel> getPlants(BuildContext context, String token) async {

    try {
      Response response = await dio.get(
        endpoint,
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );
      return AllPlantModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }
}
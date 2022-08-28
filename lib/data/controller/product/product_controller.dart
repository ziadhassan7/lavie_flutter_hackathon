import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:la_vie_web/data/model/products/plant_model/all_plant_model.dart';
import 'package:la_vie_web/data/model/products/products_model/all_product_model.dart';
import 'package:la_vie_web/data/model/products/products_model/product_model.dart';
import 'package:la_vie_web/data/model/products/seed_model/all_seed_model.dart';
import 'package:la_vie_web/data/model/products/tool_model/all_tool_model.dart';
import 'package:la_vie_web/presentation/provider/auth_provider.dart';
import '../../../data/model/products/products_model/all_product_model.dart';
import '../../../data/repository/product/plant_repository.dart';
import '../../../data/repository/product/product_repository.dart';
import '../../../data/repository/product/seed_repository.dart';
import '../../../data/repository/product/tool_repository.dart';
import '../view_handler.dart';


class ProductController {

  static Future<AllProductsModel> getAllProducts(
      BuildContext context) {

    try {
      return ProductRepository().getProducts(context, AuthProvider.globalAuth);
    } on DioError catch (e) {
      print("Authorization errroooooor");
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }

  }

  static Future<ProductModel> getOneProduct(
      BuildContext context, {required String productId}) {

    try {
      return ProductRepository().getProductOne(
          context,
          AuthProvider.globalAuth,
          productId: productId
      );
    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }

  }

  ///---------------------------------------------------------------------------


  static Future<AllPlantModel> getAllPlants(BuildContext context){

    try {
      return PlantRepository().getPlants(context, AuthProvider.globalAuth);
    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }
  }


  ///---------------------------------------------------------------------------


  static Future<AllSeedModel> getAllSeeds(BuildContext context){

    try {
      return SeedRepository().getSeeds(context, AuthProvider.globalAuth);
    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }
  }

  ///---------------------------------------------------------------------------


  static Future<AllToolModel> getAllTools(BuildContext context,){

    try {
      return ToolRepository().getTools(context, AuthProvider.globalAuth);
    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      rethrow;
    }
  }
}

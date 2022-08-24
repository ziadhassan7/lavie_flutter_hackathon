import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:la_vie_web/business/dio_client.dart';
import 'package:la_vie_web/business/dio_exception.dart';
import '../../controller/view_handler.dart';
import '../../model/products/products_model/all_product_model.dart';
import '../../model/products/products_model/product_model.dart';


class ProductRepository{
  DioClient dio = DioClient();
  final endpoint = "/api/v1/products";


  /// Get One Product
  Future<ProductModel> getProductOne(BuildContext context, String token,
      {required String productId}) async {

    try {
      Response response = await dio.get(
        "$endpoint/$productId",
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );

      return ProductModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }

  /// Get All Products
  Future<AllProductsModel> getProducts(BuildContext context, String token) async {

    try {
      Response response = await dio.get(
        endpoint,
        options: Options(
            headers: {"Authorization": "Bearer $token"})
      );

      return AllProductsModel.fromJson(response.data);

    } catch (e) {
      ViewHandler.handleOutDatedAuth(context, e);
      print("Authorization error");
      rethrow;
    }
  }

}
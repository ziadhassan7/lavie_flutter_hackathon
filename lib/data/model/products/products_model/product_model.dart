import 'data/product_data.dart';


class ProductModel {
  String? type;
  String? message;
  ProductData? data;

  ProductModel({this.type, this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? ProductData.fromJson(json['data']) : null;
  }
}


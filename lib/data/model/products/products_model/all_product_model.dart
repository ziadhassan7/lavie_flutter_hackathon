import 'data/product_data.dart';

class AllProductsModel {
  String? type;
  String? message;
  List<ProductData>? allData;

  AllProductsModel(
      {this.type,
        this.message,
        this.allData});


  AllProductsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];

    if (json['data'] != null) {
      allData = <ProductData>[];
      json['data'].forEach((v) {
        allData!.add(ProductData.fromJson(v));
      });
    }
  }

}


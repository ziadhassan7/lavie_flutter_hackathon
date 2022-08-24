import '../../../app_core/local_db_constants.dart';

class CartModel {

  final String id;
  final String name;
  final String image;
  final String price;
  final int quantity;

  CartModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });


  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map[columnId],
      name: map[columnName],
      image: map[columnImage],
      price: map[columnPrice],
      quantity: map[columnQuantity],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnName: name,
      columnImage: image,
      columnPrice: price,
      columnQuantity: quantity,
    };
  }
}
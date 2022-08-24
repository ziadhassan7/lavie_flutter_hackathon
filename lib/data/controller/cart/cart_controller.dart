import '../../../business/sql_client.dart';
import '../../model/cart/cart_model.dart';

class CartController {

  final String id;
  final String name;
  final String image;
  final String price;
  final int quantity;

  CartController({
    required this. id,
    required this. name,
    required this. image,
    required this. price,
    required this. quantity,
  });

  ///                                                                           /Add Item function
  Future<void> addToCart() async {

    bool isDuplicate = false;
    List<CartModel> models = await getListItems();

    int oldQuantity = 1;

    for (var element in models) {
      if(element.name == name) {
        isDuplicate = true;
        oldQuantity = element.quantity;
      }
    }


    if(isDuplicate) {
      incrementItem(oldQuantity);
    } else {
      createItem();
    }

  }

  ///Create
  Future<void> createItem() async {
    SqlClient.instance.createItem(CartModel(
        id: id,
        name: name,
        image: image,
        price: price,
        quantity: quantity
    ));
  }


  ///                                                                           /Update item function
  Future<void> incrementItem(int oldQuantity) async {

    SqlClient.instance.updateItem(CartModel(
        id: id,
        name: name,
        image: image,
        price: price,
        quantity: oldQuantity +1));

  }


  ///                                                                           /Delete Item function
  static Future<void> deleteItem(String id) async {
    SqlClient.instance.deleteItem(id);
  }

  ///                                                                           /Delete Item function
  static Future<void> deleteAllItems() async {
    SqlClient.instance.deleteAllItem();
  }


  ///                                                                           /Get One Item function
  Future<CartModel> getCurrentItems() async {
    return SqlClient.instance.readOneElement(id);
  }

  ///                                                                           /Get All Items function
  static Future<List<CartModel>> getListItems() async {
      return SqlClient.instance.readAllElements();
  }
}
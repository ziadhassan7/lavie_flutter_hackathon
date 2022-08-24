import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/cart/cart_controller.dart';
import 'package:la_vie_web/presentation/view/cart/widget/empty_cart_view.dart';
import 'package:la_vie_web/presentation/view/register/widget/button_accent.dart';
import 'package:provider/provider.dart';
import '../../../../business/sql_client.dart';
import '../../../../data/model/cart/cart_model.dart';
import '../../../provider/cart_provider.dart';
import '../../common/text_poppins.dart';
import '../widget/cart_list_item.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  late List<CartModel> carts;

  Future<List<CartModel>> getAllElements() async {
    carts = await SqlClient.instance.readAllElements();

    return carts;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextPoppins(
            "My Cart", weight: FontWeight.w600, color: Colors.black87,),

          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          toolbarHeight: 65,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black87,),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),

        body: Consumer<CartProvider>(
          builder: (context, provider, child) {
            return FutureBuilder(
                future: getAllElements(),

                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return carts.isNotEmpty

                        ? listView(context)

                        : const EmptyCartView();
                  } else {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }
            );
          },
        )

    );
  }


  Widget listView(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                  itemCount: carts.length,
                  itemBuilder: (context, index) {
                    return CartListItem(
                      id: carts[index].id,
                      name: carts[index].name,
                      imageUrl: carts[index].image,
                      price: carts[index].price,
                      quantity: carts[index].quantity,
                    );
                  }),
            ),
          ),

          Padding(
              padding: const EdgeInsets.all(10),

              child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.90,

                child: ButtonAccent("Checkout",
                    onPressed: () => Provider.of<CartProvider>(context, listen: false).checkout(context)),
              )
          )
        ]
    );
  }
}

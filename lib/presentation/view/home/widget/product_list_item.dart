import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/view_handler.dart';
import 'package:la_vie_web/data/model/common_models/general_data.dart';
import 'package:progressive_image/progressive_image.dart';
import '../../../../app_core/color_constants.dart';
import '../../../../data/controller/cart/cart_controller.dart';
import '../../../../data/model/cart/cart_model.dart';
import '../../common/text_poppins.dart';
import '../../register/widget/button_accent.dart';

class ProductListItem extends StatelessWidget {
  final String imageBaseUrl = "https://lavie.orangedigitalcenteregypt.com";
  GeneralData data;
  int? price;

  ProductListItem({Key? key, required this.data, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),

      child: Padding(
        padding: const EdgeInsets.all(10),

        child: Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: "$imageBaseUrl${data.imageUrl!}",

                placeholder: (context, url) {
                  return Image.asset("assets/loading.gif");
                },
                errorWidget: (context, url, error) {
                  return Image.asset("assets/placeholder.jpg",);
                },
                height: 150 ,
                width: 120,
              ),
            ),

            TextPoppins(data.name!, size: 18, weight: FontWeight.w600,),
            if(price != 0) TextPoppins("${price!} EGP"),

            ButtonAccent(
              "  Add To Cart  ",

              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(ColorConstants.accent),

                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  )
                )
                ),
              onPressed: ()=>addItem(context),
            )
          ],
        ),
      ),
    );
  }


  void addItem (BuildContext context) async {
    CartController control = CartController(
        id: data.id!,
        name: data.name!,
        image: data.imageUrl!,
        price: price != 0 ? price.toString() : "0",
        quantity: 1
    );

    control.addToCart();

    List<CartModel> models = await CartController.getListItems();

    for(var element in models) {
      print(element.name);
      print(element.quantity);
    }

    print(models.length);

    ViewHandler.showSnackBar(context, "Added to cart");

  }

}

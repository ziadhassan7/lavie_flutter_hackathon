import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:la_vie_web/app_core/color_constants.dart';
import 'package:la_vie_web/presentation/provider/cart_provider.dart';
import 'package:la_vie_web/presentation/view/common/text_poppins.dart';
import 'package:provider/provider.dart';

import '../../../../data/controller/cart/cart_controller.dart';

class CartListItem extends StatelessWidget {
  final String imageBaseUrl = "https://lavie.orangedigitalcenteregypt.com";

  final String id;
  final String name;
  final String imageUrl;
  final String price;
  final int quantity;

  const CartListItem({
    Key? key,
    required this. id,
    required this. name,
    required this. imageUrl,
    required this. price,
    required this. quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            itemImage(),
            infoBox(),
            IconButton(
                onPressed: () => Provider.of<CartProvider>(context, listen: false).deleteItem(id),
                icon: const Icon(Icons.delete, color: ColorConstants.accent,)
            ),
          ],
        ),
      ),
    );
  }

  /// Image
  Widget itemImage() {
    return Expanded(
      child: SizedBox(
        child: CachedNetworkImage(
          imageUrl: "$imageBaseUrl${imageUrl}",
          placeholder: (context, url) => Image.asset("assets/loading.gif"),
          errorWidget: (context, url, error) {
            return Image.asset(
              "assets/placeholder.jpg",
            );
          },
          fit: BoxFit.fitHeight,
          height: 110,
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }

  ///Info
  Widget infoBox() {
    return Expanded(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextPoppins(name, size: 17, weight: FontWeight.w600,),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextPoppins("price: $price"),
          ),

          TextPoppins("quantity: ${quantity.toString()}", color: ColorConstants.accent, ),
        ],
      ),
    );
  }
}

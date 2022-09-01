import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_vie_web/app_core/color_constants.dart';
import 'package:la_vie_web/data/controller/view_handler.dart';
import '../../cart/screen/cart_screen.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),

      child: InkWell(
        onTap: () => ViewHandler.navigateTo(context, CartScreen(), isReplace: false),

        child: Container(
          decoration: const BoxDecoration(
            color: ColorConstants.accent,
            borderRadius: BorderRadius.all(Radius.circular(7))
          ),

          padding: const EdgeInsets.all(10),

          child: SvgPicture.asset("assets/cart.svg"),
        ),
      ),
    );
  }
}

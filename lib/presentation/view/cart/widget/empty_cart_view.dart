import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_vie_web/presentation/view/common/text_poppins.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),

            child: SvgPicture.asset("assets/empty_item.svg")
          ),

          TextPoppins("Your cart is empty", size: 20, weight: FontWeight.w600,)
        ],
      ),
    );
  }
}

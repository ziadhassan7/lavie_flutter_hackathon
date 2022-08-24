import 'package:flutter/material.dart';
import 'package:la_vie_web/app_core/color_constants.dart';
import '../../common/text_poppins.dart';

class ButtonAccent extends StatelessWidget {

  String text;
  double textSize;
  ButtonStyle? style;
  Function()? onPressed;

  ButtonAccent(this.text, {Key? key, this.textSize = 13, this.style ,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton(
        style: style ?? ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorConstants.accent)
        ),

        onPressed: onPressed,

        child: TextPoppins(
          text,
          size: textSize,
          weight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}

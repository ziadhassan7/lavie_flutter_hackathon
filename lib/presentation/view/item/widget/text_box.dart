import 'package:flutter/material.dart';

import '../../../../app_core/color_constants.dart';
import '../../common/text_poppins.dart';

class TextBox extends StatelessWidget {
  String title;
  String description;

  TextBox({Key? key, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25),

      child: Expanded(
        child: SizedBox(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              TextPoppins(
                title,
                size: 20,
                weight: FontWeight.bold,

              ),

              TextPoppins(
                description,
                size: 12,
                color: ColorConstants.primaryLight,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:la_vie_web/app_core/color_constants.dart';
import '../../common/text_poppins.dart';

class LoginUserInput extends StatelessWidget {
  String label;
  bool isPassword;
  TextEditingController textController;

  LoginUserInput(
      {Key? key,
      required this.label,
      required this.isPassword,
      required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          TextPoppins(
            label,
            size: 12,
            weight: FontWeight.w500,
            color: ColorConstants.primaryLight,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),

            child: TextFormField(
              obscureText: isPassword? true:false,
              enableSuggestions: isPassword? false:true,
              autocorrect: isPassword? false:true,

              controller: textController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: ColorConstants.accent),
                    borderRadius: BorderRadius.circular(5)),

                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}

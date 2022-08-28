import 'package:flutter/material.dart';
import 'package:la_vie_web/app_core/color_constants.dart';
import 'package:la_vie_web/presentation/provider/auth_provider.dart';
import 'package:la_vie_web/presentation/view/common/text_poppins.dart';
import 'package:provider/provider.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [

          Consumer<AuthProvider>(
            builder: (context, provider, child) {
              return Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),),
                checkColor: ColorConstants.accent,
                activeColor: Colors.black12,
                value: AuthProvider.rememberMe,
                onChanged: (bool? value) {
                  provider.toggleRememberMe();
                },
              );
            },
          ),

          TextPoppins("Remember me?",
            size: 11,
            color: ColorConstants.primaryLight,)
        ],
      ),
    );
  }
}

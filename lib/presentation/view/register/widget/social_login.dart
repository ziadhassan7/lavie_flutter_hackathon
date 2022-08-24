import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_vie_web/app_core/color_constants.dart';
import '../../../../data/controller/register/register_controller.dart';
import 'package:la_vie_web/presentation/view/common/text_poppins.dart';

class BottomSocialLogin extends StatelessWidget {
  const BottomSocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              customDivider(context),
              TextPoppins("  or continue with  ", size: 11, color: ColorConstants.accent,),
              customDivider(context),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                customBtn("assets/google_logo.svg", size: 23, onTap: RegisterController.loginWithGoogle),
                customBtn("assets/facebook_logo.svg", size: 23),
              ],
            ),
          )

        ],
      ),
    );
  }

  Widget customDivider(BuildContext context){
    return Container(color: Colors.black12,
      width: MediaQuery.of(context).size.width/4, height: 1,);
  }

  Widget customBtn(String iconPath, {required double size, Function()? onTap}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),

      child: InkWell(
        onTap: onTap,
        child: SvgPicture.asset(iconPath, height: size, width: size,),
      )
    );
  }
}

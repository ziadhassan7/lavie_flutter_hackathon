import 'package:flutter/material.dart';
import 'package:la_vie_web/app_core/color_constants.dart';
import 'package:la_vie_web/presentation/view/register/widget/button_accent.dart';
import 'package:la_vie_web/presentation/view/common/user_input.dart';
import '../../../../data/controller/register/register_controller.dart';
import '../../common/text_poppins.dart';
import '../widget/social_login.dart';

class SignupView extends StatelessWidget {
  TabController tabController;

  SignupView({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
          children: [
            Expanded(
                child: UserInput(label: "First Name",
                isPassword: false,
                textController: RegisterController.firstName,
                isExpanded: false,)),

            Expanded(
                child: UserInput(label: "Last Name",
                isPassword: false,
                textController: RegisterController.lastName,
                isExpanded: false,)),
          ],
        ),

        UserInput(label: "Email",
          isPassword: false,
          textController: RegisterController.email,
          isExpanded: false,),

        UserInput(label: "Password",
          isPassword: true,
          textController: RegisterController.password,
          isExpanded: false,),

        UserInput(label: "Re-enter Password",
          isPassword: true,
          textController: RegisterController.rePassword,
          isExpanded: false,),


        Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          height: 80,
          width: 470,

          child: Expanded(
              child: ButtonAccent("Sign Up", onPressed: () => signUp(context),)
          ),
        ),


        Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              TextPoppins("Already have an account?", size: 10, color: ColorConstants.primaryLight,),
              TextButton(
                onPressed: ()=> goToLogin(),
                child: TextPoppins("Sign In", size: 10, color: ColorConstants.accent,),
              )
            ]
        ),


        const BottomSocialLogin(),
      ]

    );
  }

  void goToLogin(){
    tabController.animateTo(1);
  }

  void signUp(BuildContext context){

    RegisterController.signUp(context);
  }
}

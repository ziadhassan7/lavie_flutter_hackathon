import 'package:flutter/material.dart';
import '../../app_core/color_constants.dart';
import '../../presentation/view/register/screen/register_screen.dart';

class ViewHandler {


  static void navigateTo(BuildContext context, Widget screen, {required bool isReplace}){
    if (isReplace) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );

    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    }

  }

  static void handleOutDatedAuth(context, e){
    print("Reeeeeess: why tho");

    if (e.response?.statusCode == 401){
      navigateTo(context, RegisterScreen(), isReplace: false);
      print("Reeeeeess: 401");
    }
  }

  static void showSnackBar(BuildContext context, String message, {duration}) {
    var snackBar = SnackBar(
      content: Text(message),
      backgroundColor: ColorConstants.accent,
      duration: Duration(milliseconds: duration??650),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
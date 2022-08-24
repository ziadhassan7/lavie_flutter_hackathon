import 'package:flutter/material.dart';
import 'package:la_vie_web/data/controller/register/register_handler.dart';
import 'package:la_vie_web/data/repository/auth_repository.dart';
import '../../../business/google_login_api.dart';


class RegisterController {

  static TextEditingController firstName = TextEditingController();
  static TextEditingController lastName = TextEditingController();
  static TextEditingController email = TextEditingController();
  static TextEditingController password = TextEditingController();
  static TextEditingController rePassword = TextEditingController();


  static void signIn(BuildContext context){

    AuthRepository().signIn(email.text, password.text).then((value) => {
      RegisterHandler.navigateToHomePage(context, value.data?.accessToken)


      // and if it catches 401 => Login

      // provider ---
      // hive     ---
      // dio      ---
      // splash   ---
      // home future list ---
      // navi bar ---
      // auth ---
      // errors
      // validators

    }).onError((error, stackTrace) => {

      RegisterHandler.handleError(context, error.toString())
    });

  }

  static void signUp(BuildContext context){

    //check that passwords are correctly typed
    if(password.text == rePassword.text){

      AuthRepository().signUp(
          firstName.text, lastName.text, email.text, password.text
      ).then((value) => {
        RegisterHandler.navigateToHomePage(context, value.data?.accessToken)

      }).onError((error, stackTrace) => {

        if(error.toString().contains("Http status error [409]")) {
          RegisterHandler.handleError(context, "Email already exists.")
        } else {
          RegisterHandler.handleError(context, error.toString())
        }

      });

    } else {
      RegisterHandler.handleError(context, "Your password isn't identical!");
    }

  }


  static void loginWithGoogle() {
    GoogleLoginApi.login();
  }

}
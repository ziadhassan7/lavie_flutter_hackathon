import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/provider/login_provider.dart';
import 'package:la_vie_web/presentation/view/common/dialog_widget.dart';
import '../../../data/shared_pref/hive_util.dart';
import '../../../presentation/view/index/index_screen.dart';
import '../view_handler.dart';

class RegisterHandler {


  static void navigateToHomePage(BuildContext context, String? auth){
    if (auth != null){
      ViewHandler.navigateTo(context, IndexScreen(authKey: auth,));

      _saveToken(auth);

    } else {
      print("ohhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh: ^^^____^^^ no auth");
    }

  }

  static void _saveToken(auth) {
    if (LoginProvider.rememberMe) {
      HiveUtil hive = HiveUtil();
      hive.put(auth);
    }
  }

  static void handleError (context, String serverResponse) {
    print("Reeeeeess: Couldn't Register $serverResponse");
    DialogWidget(
        context,
        isTextEditingDialog: false,
        dialogTitle: "Incorrect Data",
        dialogBody: serverResponse,
        firstButtonTitle: 'Ok').showAlert();
  }

}
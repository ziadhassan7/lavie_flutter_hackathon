import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/provider/auth_provider.dart';
import 'package:la_vie_web/presentation/view/common/dialog_widget.dart';
import '../../../data/shared_pref/hive_util.dart';
import '../../../presentation/view/index/index_screen.dart';
import '../view_handler.dart';

class RegisterHandler {

  static void authUser (BuildContext context, String auth) {

    _saveToken(auth);

    ViewHandler.navigateTo(context, const IndexScreen());
  }

  static void _saveToken(auth) {
    AuthProvider.setGlobalAuth(auth);

    if (AuthProvider.rememberMe) {
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
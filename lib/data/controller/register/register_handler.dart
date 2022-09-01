import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/provider/auth_provider.dart';
import 'package:la_vie_web/presentation/view/common/dialog_widget.dart';
import '../../../data/shared_pref/hive_util.dart';
import '../../../presentation/view/index/index_screen.dart';
import '../../../app_core/global_data.dart';
import '../view_handler.dart';

class RegisterHandler {

  static void authUser (BuildContext context,
      {required String userId, required String auth}) {

    _saveGlobals(auth, userId);

    //now go to HomePage
    ViewHandler.navigateTo(context, const IndexScreen(), isReplace: true);
  }

  static void _saveGlobals(auth, userId) {
    //save userAuth across application
    GlobalData.setGlobalAuth(auth);

    //save userId across application
    GlobalData.setGlobalUserId(userId);

    if (AuthProvider.rememberMe) {
      HiveUtil hive = HiveUtil();
      hive.putAuth(auth); //Save auth permanently
      hive.putUserId(userId); //Save userId permanently
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
import 'package:flutter/material.dart';


class DialogWidget {

  static TextEditingController dialogTextController = TextEditingController();

  BuildContext context;
  bool isTextEditingDialog;

  String dialogTitle;
  String? dialogBody;

  String firstButtonTitle;
  Function()? firstButtonFunction;

  String? secondButtonTitle;
  Function()? secondButtonFunction;


  DialogWidget(
    this.context,
    {required this.isTextEditingDialog,
    required this.dialogTitle,
    this.dialogBody,
    required this.firstButtonTitle,
    this.firstButtonFunction,
    this.secondButtonTitle,
    this.secondButtonFunction,
  });


  ///Button Builder
  Widget dialogButton(String tile, {Function? extraFunction}) {
    return TextButton(
      child: Text(tile),

      onPressed:  () {
        Navigator.of(context).pop(); // dismiss dialog

        extraFunction;
      },
    );
  }

  // set up the AlertDialog
  showAlert() {
    AlertDialog alertDialog = AlertDialog(

      title: Text(dialogTitle),

      content:
      isTextEditingDialog ?
        TextFormField(
            controller: dialogTextController,
            decoration: const InputDecoration(hintText: "Edit here..."),)

        : Text(dialogBody ?? "Something went wrong!!"),

      actions: [
        dialogButton(firstButtonTitle, extraFunction: firstButtonFunction),
        if (isTextEditingDialog)
          dialogButton(secondButtonTitle!, extraFunction: secondButtonFunction),
      ],

    );



    //Show it!
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

}


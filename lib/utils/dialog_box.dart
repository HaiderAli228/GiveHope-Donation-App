import 'package:fancy_popups_new/fancy_popups_new.dart';
import 'package:flutter/material.dart';

class DialogBox {
  static BuildContext context = BuildContext as BuildContext;
  static errorDialogBox(var text) {
    return showDialog(
        context: context ,
        builder: (context) {
          return MyFancyPopup(
              heading: "Error!",
              body: text,
              onClose: () {
                Navigator.pop(context);
              },
              type: Type.error,
              buttonText: "Go Back");
        });
  }
}

import 'package:donation_app/utils/app_color.dart';
import 'package:fancy_popups_new/fancy_popups_new.dart';
import 'package:flutter/material.dart';

class DialogBox {
  static errorDialogBox(context, var text) {
    return showDialog(
        context: context,
        builder: (context) {
          return MyFancyPopup(
              headingStyle: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold),
              backgroundColor: AppColor.lightColor,
              bodyStyle: const TextStyle(
                  fontFamily: "Poppins", fontWeight: FontWeight.bold),
              buttonColor: AppColor.themeColor,
              buttonStyle: const TextStyle(
                  fontFamily: "Poppins", fontWeight: FontWeight.bold),
              heading: "Error!",
              body: text,
              onClose: () {
                Navigator.pop(context);
              },
              type: Type.error,
              buttonRadius: 8,
              dialogRadius: 20,
              buttonText: "Go Back");
        });
  }

  static successDialogBox(context, var text) {
    return showDialog(
        context: context,
        builder: (context) {
          return MyFancyPopup(
              headingStyle: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold),
              backgroundColor: AppColor.lightColor,
              bodyStyle: const TextStyle(
                  fontFamily: "Poppins", fontWeight: FontWeight.bold),
              buttonColor: AppColor.themeColor,
              buttonStyle: const TextStyle(
                  fontFamily: "Poppins", fontWeight: FontWeight.bold),
              heading: "Congratulation",
              body: text,
              onClose: () {
                Navigator.pop(context);
              },
              type: Type.success,
              buttonRadius: 8,
              dialogRadius: 20,
              buttonText: "Go Back");
        });
  }
}

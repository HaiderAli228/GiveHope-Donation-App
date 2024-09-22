import 'package:donation_app/utils/app_color.dart';
import 'package:fancy_popups_new/fancy_popups_new.dart';
import 'package:flutter/material.dart';

class DialogBox {
  static errorDialogBox(context, var bodyText, var headingText) {
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
              heading: headingText,
              body: bodyText,
              onClose: () {
                Navigator.pop(context);
              },
              type: Type.warning,
              buttonRadius: 8,
              dialogRadius: 20,
              buttonText: "Go Back");
        });
  }

  static successDialogBox(context, var bodyText, var headingText) {
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
              heading: headingText,
              body: bodyText,
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

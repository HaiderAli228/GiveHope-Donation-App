import 'package:donation_app/utils/app_color.dart';
import 'package:donation_app/utils/button.dart';
import 'package:donation_app/utils/small_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../routes/routes_name.dart';

class OPTVerificationScreen extends StatefulWidget {
  const OPTVerificationScreen({super.key});

  @override
  OPTVerificationScreenState createState() => OPTVerificationScreenState();
}

class OPTVerificationScreenState extends State<OPTVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundBodyColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context) ;
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColor.themeColor
                          .withOpacity(0.1), // Light shade of themeColor
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.arrow_back,
                        color: AppColor.themeColor),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SmallWidgets.circularIcon(context, Icons.mail_lock_rounded),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Verification",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins"),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text:
                              "Enter code that send for your security to access password of your ",
                          style: TextStyle(
                              color: Colors.black, fontFamily: "Poppins")),
                      TextSpan(
                          text: " GiveHope ",
                          style: TextStyle(
                              color: AppColor.themeColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins")),
                      TextSpan(
                          text: "account.",
                          style: TextStyle(
                              color: Colors.black, fontFamily: "Poppins")),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                SmallWidgets.textIs("Enter 6 digit code"),
                const SizedBox(
                  height: 5,
                ),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  enablePinAutofill: true,
                  enabled: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    activeColor: AppColor.themeColor,
                    activeFillColor: AppColor.themeColor,
                    inactiveColor: Colors.grey,
                    selectedColor: AppColor.themeColor,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 40,
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                  appContext: context,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.055,
                ),
                RoundButton(
                  buttonText: "Verify",
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.newPasswordScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:donation_app/utils/app_color.dart';
import 'package:donation_app/utils/button.dart';
import 'package:donation_app/utils/small_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../routes/routes_name.dart';

class OPTVerificationScreen extends StatefulWidget {
  const OPTVerificationScreen({super.key});

  @override
  OPTVerificationScreenState createState() => OPTVerificationScreenState();
}

class OPTVerificationScreenState extends State<OPTVerificationScreen> {
  String _enteredOTP = ''; // Variable to store entered OTP
  final String _correctOTP = '123456'; // Example correct OTP

  // Function to validate OTP
  bool _validateOTP(String enteredOTP) {
    if (enteredOTP.length != 6) {
      Fluttertoast.showToast(msg: 'Please enter a 6-digit OTP');
      return false;
    } else if (enteredOTP != _correctOTP) {
      Fluttertoast.showToast(msg: 'Invalid OTP. Please try again.');
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // Get screen height and width
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backgroundBodyColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: screenHeight * 0.07,
                    width: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: AppColor.themeColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(screenHeight * 0.02),
                    child: const Icon(Icons.arrow_back,
                        color: AppColor.themeColor),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                SmallWidgets.circularIcon(
                  context,
                  Icons.mail_lock_rounded,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Verification",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "Enter code that was sent to your email for security.",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                        ),
                      ),
                      TextSpan(
                        text: " GiveHope ",
                        style: TextStyle(
                          color: AppColor.themeColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                      TextSpan(
                        text: "account.",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.035,
                ),
                SmallWidgets.textIs("Enter 6 digit code"),
                const SizedBox(height: 5),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  enablePinAutofill: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    activeColor: AppColor.themeColor,
                    activeFillColor: AppColor.themeColor,
                    inactiveColor: Colors.grey,
                    selectedColor: AppColor.themeColor,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: screenHeight * 0.07,
                    fieldWidth: screenWidth * 0.12,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _enteredOTP = value; // Update OTP value
                    });
                  },
                  appContext: context,
                ),
                SizedBox(
                  height: screenHeight * 0.055,
                ),
                RoundButton(
                  buttonText: "Verify",
                  onPressed: () {
                    // Validate the OTP when pressing "Verify"
                    if (_validateOTP(_enteredOTP)) {
                      // If OTP is correct, navigate to new password screen
                      Navigator.pushNamed(
                          context, RoutesName.newPasswordScreen);
                    }
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

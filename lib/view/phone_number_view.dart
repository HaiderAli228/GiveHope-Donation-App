import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/utils/app_color.dart';
import 'package:donation_app/utils/small_widgets.dart';
import 'package:donation_app/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../utils/button.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  PhoneNumberScreenState createState() => PhoneNumberScreenState();
}

class PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileNumController = TextEditingController();
  final _mobileNumFocusNode = FocusNode();

  @override
  void dispose() {
    _mobileNumController.dispose();
    super.dispose();
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
              horizontal: screenWidth * 0.04, // Responsive horizontal padding
              vertical: screenHeight * 0.02,  // Responsive vertical padding
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: screenHeight * 0.06,  // 6% of screen height
                      width: screenHeight * 0.06,   // Square button based on height
                      decoration: BoxDecoration(
                        color: AppColor.themeColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(screenWidth * 0.02),  // 2% of screen width as padding
                      child: const Icon(Icons.arrow_back, color: AppColor.themeColor),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),  // 2% of screen height for spacing
                  SmallWidgets.circularIcon(context, Icons.phonelink_lock_rounded),
                  SizedBox(height: screenHeight * 0.02),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Forget password",
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
                          text: "You forget your password? Don't worry recover your password with",
                          style: TextStyle(color: Colors.black, fontFamily: "Poppins"),
                        ),
                        TextSpan(
                          text: " GiveHope",
                          style: TextStyle(
                            color: AppColor.themeColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.035),  // 3.5% of screen height for spacing
                  SmallWidgets.textIs("Phone Number"),
                  CustomTextField(
                    fieldValidator: MultiValidator([
                      RequiredValidator(errorText: "Phone Number required"),
                      PatternValidator(r'^03[0-9]{9}$', errorText: "Enter valid Pakistani phone number"),
                    ]).call,
                    focusNode: _mobileNumFocusNode,
                    controllerIs: _mobileNumController,
                    hintTextIs: "0300-0000000",
                    keyboardApperanceType: TextInputType.number,
                    prefixIconIs: Icons.phone,
                  ),
                  SizedBox(height: screenHeight * 0.02),  // 2% of screen height for spacing
                  RoundButton(
                    buttonText: "Next",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, RoutesName.optVerificationScreen);
                      }
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),  // Responsive space between button and text
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Try another way",
                        style: TextStyle(
                          color: AppColor.themeColor,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

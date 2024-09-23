import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/utils/app_color.dart';
import 'package:donation_app/utils/small_widgets.dart';
import 'package:donation_app/utils/text_field.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: AppColor.backgroundBodyColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
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
                  SmallWidgets.circularIcon(context, Icons.phonelink_lock_rounded),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Forget password",
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
                                "You forget your password ? don't worry cover your password with",
                            style: TextStyle(
                                color: Colors.black, fontFamily: "Poppins")),
                        TextSpan(
                            text: " GiveHope",
                            style: TextStyle(
                                color: AppColor.themeColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins")),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  SmallWidgets.textIs("Phone Number"),
                  CustomTextField(
                      focusNode: _mobileNumFocusNode,
                      controllerIs: _mobileNumController,
                      hintTextIs: "+92-300-0000000",
                      keyboardApperanceType: TextInputType.number,
                      prefixIconIs: Icons.phone),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.020,
                  ),
                  RoundButton(
                      buttonText: "Next",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(
                              context, RoutesName.optVerificationScreen);
                        }
                      }),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Try another way",
                          style: TextStyle(
                              color: AppColor.themeColor,
                              fontFamily: "Poppins"),
                        )),
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

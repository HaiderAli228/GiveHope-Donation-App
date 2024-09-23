import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/utils/app_color.dart';
import 'package:donation_app/utils/button.dart';
import 'package:donation_app/utils/small_widgets.dart';
import 'package:donation_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  NewPasswordScreenState createState() => NewPasswordScreenState();
}

class NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _cNewPasswordController = TextEditingController();
  final FocusNode newPasswordFocusNode = FocusNode();
  final FocusNode cNewPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _cNewPasswordController.dispose();
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
                  SmallWidgets.circularIcon(context, Icons.lock_clock_rounded),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Create password",
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
                            text: "Create your new password to secure your ",
                            style: TextStyle(
                                color: Colors.black, fontFamily: "Poppins")),
                        TextSpan(
                            text: " GiveHope",
                            style: TextStyle(
                                color: AppColor.themeColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins")),
                        TextSpan(
                            text: " account.",
                            style: TextStyle(
                                color: Colors.black, fontFamily: "Poppins")),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  SmallWidgets.textIs("New Password"),
                  CustomTextField(
                      focusNode: newPasswordFocusNode,
                      nextFocusNode: cNewPasswordFocusNode,
                      suffixIconIs: Icons.visibility_off,
                      controllerIs: _newPasswordController,
                      hintTextIs: "new password",
                      keyboardApperanceType: TextInputType.number,
                      prefixIconIs: Icons.lock_rounded),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  SmallWidgets.textIs("Confirm New Password"),
                  CustomTextField(
                      focusNode: cNewPasswordFocusNode,
                      controllerIs: _cNewPasswordController,
                      hintTextIs: "confirm new password",
                      suffixIconIs: Icons.visibility_off,
                      keyboardApperanceType: TextInputType.number,
                      prefixIconIs: Icons.lock_rounded),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.055,
                  ),
                  RoundButton(
                      buttonText: "Create new password",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(
                              context, RoutesName.happyScreen);
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

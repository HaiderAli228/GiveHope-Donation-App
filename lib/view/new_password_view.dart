import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/utils/app_color.dart';
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                      child: CircleAvatar(
                          backgroundColor: AppColor.themeColor,
                          minRadius: MediaQuery.of(context).size.height * 0.1,
                          child: Icon(
                            Icons.lock_clock_rounded,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.height * 0.12,
                          ))),
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
                      controllerIs: _cNewPasswordController,
                      hintTextIs: "confirm new password",
                      suffixIconIs: Icons.visibility_off,
                      keyboardApperanceType: TextInputType.number,
                      prefixIconIs: Icons.lock_rounded),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.055,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.signinScreen);
                      }
                    },
                    child: Container(
                      height: 54,
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.themeColor),
                      child: const Text(
                        "Create new password",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: AppColor.themeTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

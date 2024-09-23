import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/utils/app_color.dart';
import 'package:donation_app/utils/small_widgets.dart';
import 'package:donation_app/utils/text_field.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _userNameFocusNode = FocusNode();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Sign up",
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
                                "Ready to take the next step? Create your account to make impact on",
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
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  SmallWidgets.textIs("Name"),
                  CustomTextField(
                      fieldValidator: MultiValidator([
                        RequiredValidator(errorText: "Name required"),
                      ]).call,
                      controllerIs: _userNameController,
                      focusNode: _userNameFocusNode,
                      nextFocusNode: _emailFocusNode,
                      hintTextIs: "Haider Ali",
                      keyboardApperanceType: TextInputType.text,
                      prefixIconIs: Icons.alternate_email),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.013,
                  ),
                  SmallWidgets.textIs("Email Address"),
                  CustomTextField(
                      fieldValidator: MultiValidator([
                        RequiredValidator(errorText: "Email required"),
                        EmailValidator(errorText: "Enter Valid email address")
                      ]).call,
                      controllerIs: _emailController,
                      focusNode: _emailFocusNode,
                      nextFocusNode: _passwordFocusNode,
                      hintTextIs: "example@gmail.com",
                      keyboardApperanceType: TextInputType.emailAddress,
                      prefixIconIs: Icons.alternate_email),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.013,
                  ),
                  SmallWidgets.textIs("Password"),
                  CustomTextField(
                      fieldValidator: MultiValidator([
                        RequiredValidator(errorText: "Password required"),
                        MinLengthValidator(8,
                            errorText:
                                "Password must be at least 8 characters long")
                      ]).call,
                      focusNode: _passwordFocusNode,
                      keyboardApperanceType: TextInputType.emailAddress,
                      nextFocusNode: _confirmPasswordFocusNode,
                      controllerIs: _passwordController,
                      suffixIconIs: Icons.visibility_off,
                      prefixIconIs: Icons.lock),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.013,
                  ),
                  SmallWidgets.textIs("Confirm password"),
                  CustomTextField(
                    fieldValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm password is required";
                      }
                      if (value.length < 8) {
                        return "Password must be at least 8 characters long";
                      }
                      if (value != _passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null; // Return null if there is no error
                    },
                    keyboardApperanceType: TextInputType.emailAddress,
                    focusNode: _confirmPasswordFocusNode,
                    controllerIs: _confirmPasswordController,
                    suffixIconIs: Icons.visibility_off,
                    prefixIconIs: Icons.lock,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.homeScreen);
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
                        "Sign up ",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: AppColor.themeTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RoutesName.signinScreen);
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                                color: AppColor.themeColor,
                                fontFamily: "Poppins"),
                          ))
                    ],
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

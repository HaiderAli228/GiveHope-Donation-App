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
    // Screen dimensions for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backgroundBodyColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04), // 4% padding
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.05), // 5% top space
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
                  SizedBox(height: screenHeight * 0.03), // 3% vertical space

                  // Name Input
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
                      prefixIconIs: Icons.person),
                  SizedBox(
                      height: screenHeight *
                          0.02), // Adjust height for responsiveness

                  // Email Input
                  SmallWidgets.textIs("Email Address"),
                  CustomTextField(
                      fieldValidator: MultiValidator([
                        RequiredValidator(errorText: "Email required"),
                        EmailValidator(errorText: "Enter valid email address")
                      ]).call,
                      controllerIs: _emailController,
                      focusNode: _emailFocusNode,
                      nextFocusNode: _passwordFocusNode,
                      hintTextIs: "example@gmail.com",
                      keyboardApperanceType: TextInputType.emailAddress,
                      prefixIconIs: Icons.alternate_email),
                  SizedBox(
                      height: screenHeight *
                          0.02), // Adjust height for responsiveness

                  // Password Input
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
                      height: screenHeight *
                          0.02), // Adjust height for responsiveness

                  // Confirm Password Input
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
                      return null;
                    },
                    keyboardApperanceType: TextInputType.emailAddress,
                    focusNode: _confirmPasswordFocusNode,
                    controllerIs: _confirmPasswordController,
                    suffixIconIs: Icons.visibility_off,
                    prefixIconIs: Icons.lock,
                  ),
                  SizedBox(
                      height: screenHeight *
                          0.05), // Adjust height for responsiveness

                  // Sign Up Button
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.homeScreen);
                      }
                    },
                    child: Container(
                      height: screenHeight *
                          0.07, // Responsive height for the button
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.all(screenWidth * 0.015), // Adjust padding
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.themeColor,
                      ),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: AppColor.themeTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05, // Responsive font size
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: screenHeight *
                          0.02), // Adjust height for responsiveness

                  // Sign In Link
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
                          Navigator.pushNamed(context, RoutesName.signinScreen);
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              color: AppColor.themeColor,
                              fontFamily: "Poppins"),
                        ),
                      )
                    ],
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

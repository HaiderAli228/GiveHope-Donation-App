import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/utils/app_color.dart';
import 'package:donation_app/utils/small_widgets.dart';
import 'package:donation_app/utils/text_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  ForgetPasswordScreenState createState() => ForgetPasswordScreenState();
}

class ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
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
                            Icons.lock,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.height * 0.12,
                          ))),
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
                  SmallWidgets.textIs("Email Address"),
                  CustomTextField(
                      controllerIs: _emailController,
                      hintTextIs: "example@gmail.com",
                      keyboardApperanceType: TextInputType.emailAddress,
                      prefixIconIs: Icons.alternate_email),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.055,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 54,
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.themeColor),
                      child: const Text(
                        "Next",
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
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RoutesName.mobileNumberScreen);
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

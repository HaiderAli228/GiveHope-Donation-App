import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/utils/app_color.dart';
import 'package:donation_app/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HappyView extends StatefulWidget {
  const HappyView({super.key});

  @override
  State<HappyView> createState() => _HappyViewState();
}

class _HappyViewState extends State<HappyView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundBodyColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Lottie.asset("assets/images/lock.json", repeat:false),
                  Lottie.asset("assets/images/happy.json"),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "Congratulation",
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
                        text: "Your new password created by ",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Poppins")),
                    TextSpan(
                        text: "GiveHope",
                        style: TextStyle(
                            color: AppColor.themeColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins")),
                    TextSpan(
                        text: " Successfully.",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Poppins")),
                  ],
                ),
              ),
              RoundButton(
                  buttonText: " Sign in ",
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RoutesName.signinScreen);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

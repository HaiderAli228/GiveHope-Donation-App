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
    // Get the screen size for responsiveness
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundBodyColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, // 5% of screen width
              vertical: height * 0.03, // 3% of screen height
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.4, // 40% of screen height
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Lottie.asset(
                        "assets/images/lock.json",
                        alignment: Alignment.center,
                        repeat: false,
                      ),
                      Lottie.asset(
                        "assets/images/happy.json",
                        repeat: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02), // Add some spacing

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Congratulation",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Your new password created by ",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                        ),
                      ),
                      TextSpan(
                        text: "GiveHope",
                        style: TextStyle(
                          color: AppColor.themeColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                      TextSpan(
                        text: " Successfully.",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.05), // More space before button

                RoundButton(
                  buttonText: "Sign in",
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RoutesName.signinScreen);
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

import 'dart:async';

import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, RoutesName.introScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundBodyColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 20,
            ),
            Lottie.asset("assets/images/donation_intro.json",
                repeat: false,
                alignment: Alignment.center,
                fit: BoxFit.cover),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Welcome to GiveHope",
                style: TextStyle(
                    color: AppColor.themeColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

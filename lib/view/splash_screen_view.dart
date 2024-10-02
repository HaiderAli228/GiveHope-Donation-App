import 'dart:async';
import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb to check platform

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    // Check if the app is running on mobile or web
    if (!kIsWeb) {
      // Show splash screen for 5 seconds on mobile, then navigate to intro screen
      Timer(const Duration(seconds: 5), () {
        Navigator.pushNamed(context, RoutesName.introScreen);
      });
    } else {
      // Directly navigate to the intro screen on the web
      Future.microtask(() => Navigator.pushNamed(context, RoutesName.introScreen));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Skip rendering the splash screen on the web
    if (kIsWeb) {
      return const SizedBox.shrink();
    }

    // Use MediaQuery to fetch screen size for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backgroundBodyColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: screenHeight * 0.05), // 5% of screen height for top padding

            // Lottie animation with responsive sizing
            Lottie.asset(
              "assets/images/donation_intro.json",
              repeat: false,
              alignment: Alignment.center,
              fit: BoxFit.cover,
              height: screenHeight * 0.5, // Adjust height to 50% of screen
              width: screenWidth * 0.9,   // Adjust width to 90% of screen
            ),

            // Welcome text with responsive padding and font size
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, // 5% of screen width for horizontal padding
                vertical: screenHeight * 0.02,  // 2% of screen height for vertical padding
              ),
              child: Text(
                "Welcome to GiveHope",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.themeColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.06, // 6% of screen width for font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

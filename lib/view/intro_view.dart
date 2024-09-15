import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          IntroductionScreen(
            pages: [
              PageViewModel(
                titleWidget: buildTitle(
                  "Welcome to ",
                  "GiveHope ",
                  "platform",
                  size,
                ),
                bodyWidget: buildBody(
                    'GiveHope believe that We make a living by what we get, but we make a life by what we give. Believe you can and you are halfway there. – Theodore Roosevelt',
                    size),
                image: buildImage('assets/images/intro2.png', size),
                decoration: getPageDecoration(size),
              ),
              PageViewModel(
                titleWidget: buildTitle(
                  "Join hands, to make better ",
                  "Hope",
                  "",
                  size,
                ),
                bodyWidget: buildBody(
                    'Donating clothes is a simple yet impactful way to support those in need and promote Hope. Charity begins at home, but should not end there',
                    size),
                image: buildImage('assets/images/intro3.png', size),
                decoration: getPageDecoration(size),
              ),
              PageViewModel(
                titleWidget: buildTitle(
                  "Let's make the world better with ",
                  "GiveHope!",
                  "",
                  size,
                ),
                bodyWidget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildBody(
                        'GiveHope is a platform where your generosity meets impact! Join us in making a difference.',
                        size),
                    SizedBox(height: size.height * 0.05),
                    // Get Started button with navigation
                    buildButton(
                      text: "Get Started",
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RoutesName.homeScreen);
                      },
                    ),
                  ],
                ),
                image: buildImage('assets/images/last2.png', size),
                decoration: getPageDecoration(size),
              ),
            ],
            onDone: () {
              Navigator.of(context)
                  .pushReplacementNamed(RoutesName.signUpScreen);
            },
            onSkip: () {
              Navigator.of(context)
                  .pushReplacementNamed(RoutesName.signUpScreen);
            },
            showSkipButton: false,
            next: buildButton(icon: Icons.arrow_forward),
            done: const SizedBox.shrink(), // Hide 'done' button
            dotsDecorator: getDotsDecorator(size),
          ),
          // Skip button at top-right corner
          Positioned(
            top: size.height * 0.05,
            right: size.width * 0.05,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(RoutesName.homeScreen);
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                    color: AppColor.themeColor,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String path, Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.1), // Responsive padding
      child: Center(
        child: Image.asset(
          path,
          width: size.width * 0.6, // Responsive image size
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildTitle(String title1, title2, title3, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05), // Responsive padding
      child: RichText(
        text: TextSpan(
          style:
              TextStyle(fontSize: size.height * 0.035), // Responsive font size
          children: [
            TextSpan(
                text: title1,
                style: const TextStyle(
                    color: Colors.black, fontFamily: "Poppins")),
            TextSpan(
                text: title2,
                style: const TextStyle(
                    color: AppColor.themeColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins")),
            TextSpan(
                text: title3,
                style: const TextStyle(
                    color: Colors.black, fontFamily: "Poppins")),
          ],
        ),
        textAlign: TextAlign.left, // Align text to left
      ),
    );
  }

  Widget buildBody(String body, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.01), // Responsive padding
      child: Text(
        body,
        style: TextStyle(
          fontSize: size.height * 0.022, // Responsive font size
          fontFamily: "Poppins",
          color: Colors.grey.shade600,
          height: 1.5,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  PageDecoration getPageDecoration(Size size) {
    return PageDecoration(
      imagePadding: EdgeInsets.all(size.height * 0.02), // Responsive padding
      titlePadding: EdgeInsets.only(
          left: 0,
          bottom: size.height * 0.01,
          right: size.width * 0.04,
          top: size.height * 0.02),
      bodyPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      pageColor: AppColor.backgroundBodyColor,
    );
  }

  DotsDecorator getDotsDecorator(Size size) {
    return DotsDecorator(
      color: Colors.green.shade100,
      activeColor: AppColor.themeColor,
      size: Size(size.width * 0.02, size.height * 0.02), // Responsive dot size
      activeSize: Size(
          size.width * 0.1, size.height * 0.01), // Responsive active dot size
      activeShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }

  Widget buildButton({String? text, IconData? icon, VoidCallback? onTap}) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap, // Added onTap for button actions
      child: Container(
        height: size.height * 0.067,
        width: text != null
            ? size.width * 0.9
            : size.width * 0.18, // Responsive button size
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
        decoration: BoxDecoration(
          color: AppColor.themeColor,
          borderRadius: BorderRadius.circular(size.height * 0.015),
        ),
        child: text != null
            ? Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  fontSize: size.height * 0.02, // Responsive font size
                ),
              )
            : Icon(
                icon,
                color: Colors.white,
                size: size.height * 0.03, // Responsive icon size
              ),
      ),
    );
  }
}

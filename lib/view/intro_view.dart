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
                ),
                bodyWidget: buildBody(
                    'GiveHope believe that We make a living by what we get, but we make a life by what we give. Believe you can and you are halfway there. – Theodore Roosevelt'),
                image: buildImage('assets/images/intro2.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                titleWidget: buildTitle(
                  "Join hands, to make better ",
                  "Hope",
                  "",
                ),
                bodyWidget: buildBody(
                    'Donating clothes is a simple yet impactful way to support those in need and promote Hope.Charity begins at home, but should not end there'),
                image: buildImage('assets/images/intro3.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                titleWidget: buildTitle(
                  "Let's make the world better with ",
                  "GiveHope!",
                  "",
                ),
                bodyWidget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildBody(
                        'GiveHope is a platform where your generosity meets impact! Join us in making a difference.'),
                    const SizedBox(height: 20),
                    buildButton(
                        text: "Get Started"), // Added Get Started Button
                  ],
                ),
                image: buildImage('assets/images/last2.png'),
                decoration: getPageDecoration(),
              ),
            ],
            onDone: () {
              Navigator.of(context).pushReplacementNamed(RoutesName.homeScreen);
            },
            onSkip: () {
              Navigator.of(context).pushReplacementNamed(RoutesName.homeScreen);
            },
            showSkipButton: false,
            next: buildButton(icon: Icons.arrow_forward),
            done: const SizedBox.shrink(), // Hide 'done' button
            dotsDecorator: getDotsDecorator(),
          ),
          // Skip button at top-right corner
          Positioned(
            top: 40,
            right: 20,
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

  Widget buildImage(String path) {
    return Padding(
      padding: const EdgeInsets.only(top: 100), // Adjusted padding
      child: Center(
        child: Image.asset(
          path,
          width: MediaQuery.of(context).size.width * 0.60,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildTitle(String title1, title2, title3) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16), // Adjust horizontal padding
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 27),
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

  Widget buildBody(String body) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        body,
        style: TextStyle(
          fontSize: 18,
          fontFamily: "Poppins",
          color: Colors.grey.shade600,
          height: 1.5,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.all(14),
      titlePadding: EdgeInsets.only(bottom: 5, right: 16, top: 16),
      bodyPadding: EdgeInsets.only(bottom: 10, right: 16, left: 16),
      pageColor: AppColor.backgroundBodyColor,
    );
  }

  DotsDecorator getDotsDecorator() {
    return DotsDecorator(
      color: Colors.green.shade100,
      activeColor: AppColor.themeColor,
      size: const Size(10.0, 10.0),
      activeSize: const Size(32.0, 10.0),
      activeShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }

  Widget buildButton({String? text, IconData? icon}) {
    return Container(
      height: 50,
      width: text != null
          ? MediaQuery.of(context).size.width
          : 70, // Adjusted width based on button type
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColor.themeColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: text != null
          ? Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
              ),
            )
          : Icon(
              icon,
              color: Colors.white,
            ),
    );
  }
}

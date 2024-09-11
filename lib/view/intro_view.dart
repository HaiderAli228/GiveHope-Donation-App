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
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            titleWidget: buildTitle('Welcome to GiveHope'),
            bodyWidget: buildBody(
                'Welcome to GiveHope, your platform for making a difference. Whether you want to donate clothes, food, or money, our app connects your generosity with those who need it most. With just a few taps, you can help provide essential items to families, individuals, and communities in need. Every donation, big or small, brings hope and support, making the world a better place one contribution at a time. Join us in spreading kindness and making a meaningful impact!'),
            image: buildImage('assets/images/intro1.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            titleWidget: buildTitle('Donation of Clothes'),
            bodyWidget: buildBody(
                'Donating clothes is a simple yet impactful way to support those in need and promote sustainability. By giving away gently used items, you can help individuals and families access essential clothing while reducing waste. Your contribution not only offers comfort and dignity to others but also extends the life of garments that might otherwise go to landfills.'),
            image: buildImage('assets/images/intro2.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            titleWidget: buildTitle('Stay Connected'),
            bodyWidget: buildBody('This is the second intro page.'),
            image: buildImage('assets/images/intro3.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            titleWidget: buildTitle('Get Started'),
            bodyWidget: buildBody('This is the third and final intro page.'),
            image: buildImage('assets/images/intro4.png'),
            decoration: getPageDecoration(),
          ),
        ],
        onDone: () {
          Navigator.of(context).pushReplacementNamed(RoutesName.homeScreen);
        },
        onSkip: () {
          Navigator.of(context).pushReplacementNamed(RoutesName.homeScreen);
        },
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(
              color: AppColor.themeColor,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: AppColor.themeColor,
        ),
        done: const Text("Get Started",
            style: TextStyle(
                color: AppColor.themeColor,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins")),
        dotsDecorator: getDotsDecorator(),
      ),
    );
  }

  Widget buildImage(String path) {
    return Center(
      child: Image.asset(path, width: 350),
    );
  }

  Widget buildTitle(String title) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins",
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget buildBody(String body) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        body,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: "Poppins",
          height: 1.5,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.all(24),
      titlePadding: EdgeInsets.only(bottom: 5, right: 16, top: 16),
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
}

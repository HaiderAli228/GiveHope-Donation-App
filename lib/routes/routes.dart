import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/view/home_view.dart';
import 'package:donation_app/view/intro_view.dart';
import 'package:donation_app/view/sign_in.dart';
import 'package:donation_app/view/payment_view.dart';
import 'package:donation_app/view/sign_up.dart';
import 'package:donation_app/view/splash_screen_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generatedRoutes(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case RoutesName.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreenView(),
        );
      case RoutesName.paymentScreen:
        return MaterialPageRoute(
          builder: (context) => const PaymentView(),
        );
      case RoutesName.introScreen:
        return MaterialPageRoute(
          builder: (context) => const IntroScreen(),
        );
      case RoutesName.signinScreen:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );
      case RoutesName.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Text("Routes Not Found"),
            );
          },
        );
    }
  }
}

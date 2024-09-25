import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/view/contact_us_view.dart';
import 'package:donation_app/view/forget_password_view.dart';
import 'package:donation_app/view/happy_view.dart';
import 'package:donation_app/view/home_view.dart';
import 'package:donation_app/view/intro_view.dart';
import 'package:donation_app/view/new_password_view.dart';
import 'package:donation_app/view/notification_view.dart';
import 'package:donation_app/view/opt_verification_view.dart';
import 'package:donation_app/view/phone_number_view.dart';
import 'package:donation_app/view/sign_in_view.dart';
import 'package:donation_app/view/payment_view.dart';
import 'package:donation_app/view/sign_up_view.dart';
import 'package:donation_app/view/splash_screen_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generatedRoutes(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.homeScreen:
        return _createRoute(const HomeView());
      case RoutesName.newPasswordScreen:
        return _createRoute(const NewPasswordScreen());
      case RoutesName.contactUsScreen:
        return _createRoute(const ContactUsView());
      case RoutesName.notificationScreen:
        return _createRoute(NotificationView());
      case RoutesName.optVerificationScreen:
        return _createRoute(const OPTVerificationScreen());
      case RoutesName.forgetScreen:
        return _createRoute(const ForgetPasswordScreen());
      case RoutesName.mobileNumberScreen:
        return _createRoute(const PhoneNumberScreen());
      case RoutesName.splashScreen:
        return _createRoute(const SplashScreenView());
      case RoutesName.paymentScreen:
        return _createRoute(const PaymentView());
      case RoutesName.introScreen:
        return _createRoute(const IntroScreen());
      case RoutesName.signinScreen:
        return _createRoute(const SignInScreen());
      case RoutesName.happyScreen:
        return _createRoute(const HappyView());
      case RoutesName.signUpScreen:
        return _createRoute(const SignUpScreen());
      default:
        return _createRoute(
          const Scaffold(
            body: Center(child: Text("Route Not Found")),
          ),
        );
    }
  }

  // Helper function to create a smooth animated route
  static PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut; // Smooth curve for both entry and exit

        var slideAnimation = Tween<Offset>(
          begin: const Offset(0.0, 1.0), // Slide from bottom to top
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: curve,
        ));

        var fadeAnimation = Tween<double>(
          begin: 0.0, // Fade from transparent
          end: 1.0, // To fully visible
        ).animate(CurvedAnimation(
          parent: animation,
          curve: curve,
        ));

        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 700), // Smooth speed
      reverseTransitionDuration:
          const Duration(milliseconds: 700), // Smooth for pop too
    );
  }
}

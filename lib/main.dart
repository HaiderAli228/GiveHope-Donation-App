import 'package:donation_app/routes/routes.dart';
import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/utils/app_color.dart';
import 'package:donation_app/view_model/links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupStripe();
  runApp(const MyApp());
}

Future<void> _setupStripe() async {
  Stripe.publishableKey = stripePublishableKey;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.themeColor),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.paymentScreen,
      onGenerateRoute: Routes.generatedRoutes,
    );
  }
}

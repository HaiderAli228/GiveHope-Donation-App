import 'package:donation_app/routes/routes.dart';
import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = 'your publish key';

  await Stripe.instance.applySettings();
  runApp(const MyApp());
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

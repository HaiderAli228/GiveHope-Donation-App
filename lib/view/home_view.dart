import 'package:donation_app/utils/app_color.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "GiveHope",
          style: TextStyle(
            color: AppColor.themeColor,
            fontFamily: "Poppins"
          ),
        ),
      ),

    );
  }
}

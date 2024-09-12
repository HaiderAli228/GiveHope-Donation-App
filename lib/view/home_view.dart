import 'package:donation_app/utils/app_color.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundBodyColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "GiveHope",
                    style: TextStyle(
                        color: AppColor.themeColor,
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.notifications_active))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

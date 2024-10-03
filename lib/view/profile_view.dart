import 'package:donation_app/utils/app_color.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen height and width
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backgroundBodyColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, // 4% of screen width as horizontal padding
            vertical: screenHeight * 0.02, // 2% of screen height as vertical padding
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: screenHeight * 0.06, // 6% of screen height
                  width: screenHeight * 0.06, // 6% of screen height for a square button
                  decoration: BoxDecoration(
                    color: AppColor.themeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.02), // 2% of screen width for padding
                  child: const Icon(Icons.arrow_back, color: AppColor.themeColor),
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // 2% of screen height as spacing
              // Add more widgets here and ensure they are responsive
            ],
          ),
        ),
      ),
    );
  }
}

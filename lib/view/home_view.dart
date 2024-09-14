import 'package:donation_app/utils/app_color.dart';
import 'package:donation_app/utils/drawer_tile.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundBodyColor,
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: AppColor.themeColor),
                accountName: Text(
                  "Haider Ali",
                  style: TextStyle(
                      fontFamily: "Poppins", fontWeight: FontWeight.bold),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "PIC",
                    style: TextStyle(
                        color: AppColor.themeColor,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                accountEmail: Text(
                  "example@gmail.com",
                  style: TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              DrawerTile(
                iconIs: const Icon(
                  Icons.account_box,
                  color: AppColor.themeColor,
                ),
                name: "Profile",
                function: () {},
              ),
              DrawerTile(
                iconIs: const Icon(
                  Icons.history,
                  color: AppColor.themeColor,
                ),
                name: "Transaction History",
                function: () {},
              ),
              DrawerTile(
                iconIs: const Icon(
                  Icons.rule,
                  color: AppColor.themeColor,
                ),
                name: "Term & Condition",
                function: () {},
              ),
              DrawerTile(
                iconIs: const Icon(
                  Icons.color_lens,
                  color: AppColor.themeColor,
                ),
                name: "Change Theme",
                function: () {},
              ),
              DrawerTile(
                iconIs: const Icon(
                  Icons.settings,
                  color: AppColor.themeColor,
                ),
                name: "Setting",
                function: () {},
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Drawer icon
                      Builder(
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: AppColor.themeColor.withOpacity(
                                    0.1), // Light shade of themeColor
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Icon(
                                Icons.menu,
                                color: AppColor.themeColor,
                              ),
                            ),
                          );
                        },
                      ),
                      // Notification icon
                      GestureDetector(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColor.themeColor
                                .withOpacity(0.1), // Light shade of themeColor
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.notifications_active,
                              color: AppColor.themeColor),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 25),
                    children: [
                      TextSpan(
                          text: "Give",
                          style: TextStyle(
                              color: Colors.black, fontFamily: "Poppins")),
                      TextSpan(
                          text: " today, ",
                          style: TextStyle(
                              color: AppColor.themeColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins")),
                      TextSpan(
                          text: "so they can thrive",
                          style: TextStyle(
                              color: Colors.black, fontFamily: "Poppins")),
                      TextSpan(
                          text: " tomorrow!",
                          style: TextStyle(
                              color: AppColor.themeColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins")),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

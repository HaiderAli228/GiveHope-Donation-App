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
          backgroundColor: AppColor.backgroundBodyColor,
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
                  )),
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
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "GiveHope",
            style: TextStyle(
                color: AppColor.themeColor,
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

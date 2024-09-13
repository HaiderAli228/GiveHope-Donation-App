import 'package:donation_app/utils/app_color.dart';
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8), // Adjust the radius as needed
                  child: Container(
                    color: AppColor.themeTileColor, //
                    child: const ListTile(
                      leading: Icon(
                        Icons.person,
                        color: AppColor.themeColor,
                      ),
                      title: Text(
                        "Account",
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(8), // Adjust the radius as needed
                  child: Container(
                    color: AppColor.themeTileColor, //
                    child: const ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: AppColor.themeColor,
                      ),
                      title: Text(
                        "Setting",
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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

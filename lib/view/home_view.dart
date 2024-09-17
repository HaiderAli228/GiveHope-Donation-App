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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    "Urgent Causes",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const Image(
                          image: AssetImage(
                            "assets/images/start.jpg",
                          ),
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Donate for hungry people",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Stack(
                        children: [
                          // Empty part (full background)
                          Container(
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: Colors.grey
                                  .shade300, // Empty part (grey background)
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // Filled part (half-filled with theme color)
                          FractionallySizedBox(
                            widthFactor: 0.5, // Half-filled
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 10.0,
                              decoration: BoxDecoration(
                                color: AppColor.themeColor, // Filled part
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Target : Rs.50000 ",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "50%",
                              style: TextStyle(
                                  color: AppColor.themeColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:donation_app/routes/routes_name.dart';
import 'package:donation_app/utils/achievement_picture.dart';
import 'package:donation_app/utils/app_color.dart';
import 'package:donation_app/utils/button.dart';
import 'package:donation_app/utils/drawer_tile.dart';
import 'package:donation_app/utils/picture_frame.dart';
import 'package:donation_app/utils/small_widgets.dart';
import 'package:donation_app/utils/text_field.dart';
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
                ),
              ),
              DrawerTile(
                iconIs: const Icon(
                  Icons.account_box,
                  color: AppColor.themeColor,
                ),
                name: "Profile",
                function: () {
                  Navigator.pushNamed(context, RoutesName.profileScreen);
                },
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
                  Icons.contact_phone_rounded,
                  color: AppColor.themeColor,
                ),
                name: "Contact us",
                function: () {
                  print("Tap ");
                  Navigator.pushNamed(context, RoutesName.contactUsScreen);
                },
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
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.notificationScreen);
                        },
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
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controllerIs: TextEditingController(),
                    keyboardApperanceType: TextInputType.text,
                    focusNode: FocusNode(),
                    hintTextIs: "Type to search here",
                    prefixIconIs: Icons.search),
                const SizedBox(
                  height: 10,
                ),
                SmallWidgets.heading("Urgent Causes"),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      PictureFrame(
                        targetText: "Target : Rs.50000",
                        titleText: "Donate for hungry people",
                        completion: 0.6,
                        imagesIs: "assets/images/start.jpg",
                        targetCompletion: "60%",
                      ),
                      PictureFrame(
                        targetText: "Target : Rs.300000",
                        titleText: "Donate Medicine for patient",
                        completion: 0.3,
                        imagesIs: "assets/images/medicine.jpg",
                        targetCompletion: "30%",
                      ),
                      PictureFrame(
                        targetText: "Target : Rs.100000",
                        titleText: "Donate Clothes",
                        completion: 0.7,
                        imagesIs: "assets/images/last.jpg",
                        targetCompletion: "70%",
                      ),
                      PictureFrame(
                        targetText: "Target : Rs.80000",
                        titleText: "Donate Money",
                        completion: 0.4,
                        imagesIs: "assets/images/center.jpg",
                        targetCompletion: "40%",
                      ),
                    ],
                  ),
                ),
                SmallWidgets.heading("Our Achievements"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: const AchievementPictureFrame(
                        imagesIs: "assets/images/intro1.png",
                        titleText: "50+",
                        subTitleText: "Donation",
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: const AchievementPictureFrame(
                        imagesIs: "assets/images/intro2.png",
                        titleText: "70+",
                        subTitleText: "Volunteer",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: const AchievementPictureFrame(
                        imagesIs: "assets/images/intro3.png",
                        titleText: "50+",
                        subTitleText: "Smile Served",
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: const AchievementPictureFrame(
                        imagesIs: "assets/images/intro4.png",
                        titleText: "50+",
                        subTitleText: "NGO'S",
                      ),
                    ),
                  ],
                ),
                SmallWidgets.heading("Our Services"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallWidgets.servicesSection(
                        context, "Supports", Icons.account_box_rounded),
                    SmallWidgets.servicesSection(
                        context, "Supports", Icons.question_answer_outlined),
                    SmallWidgets.servicesSection(
                        context, "Supports", Icons.support)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SmallWidgets.heading("How can we help ?"),
                SmallWidgets.listTileIs(
                    "Volunteer",
                    "the text will wrap to the next line without causing overflow errors.",
                    Icons.volunteer_activism_rounded),
                const SizedBox(
                  height: 20,
                ),
                SmallWidgets.listTileIs(
                    "Contribute Food",
                    "The text will wrap to the next line without causing overflow errors.",
                    Icons.fastfood_rounded),
                RoundButton(
                  buttonText: "Donate now",
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.paymentScreen);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

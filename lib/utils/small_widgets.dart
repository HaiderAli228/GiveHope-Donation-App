import 'package:flutter/material.dart';

import 'app_color.dart';

class SmallWidgets {
  static Widget textIs(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey.shade600, fontFamily: "Poppins"),
      ),
    );
  }

  static Widget heading(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 2),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  static servicesSection(context, String name, IconData data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.height * 0.1,
          padding: const EdgeInsets.all(6),
          margin: const EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.lightColor),
          child: Icon(
            data,
            color: AppColor.themeColor,
            size: 40,
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

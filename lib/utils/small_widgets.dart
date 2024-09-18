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
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            name,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
  static Widget listTileIs(String titleText,String subTitle , IconData dataIs) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(6),
            color: AppColor.lightColor,
          ),
          child:  Icon(
            dataIs,
            color: AppColor.themeColor,
            size: 50,
          ),
        ),
        // Expanding the Column to allow text wrapping
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Wrapping the subtitle text properly
                Text(
                  subTitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true, // Ensure the text will wrap
                  overflow: TextOverflow.visible, // Allow the text to wrap visibly
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

}

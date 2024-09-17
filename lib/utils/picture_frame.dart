import 'package:flutter/material.dart';

import 'app_color.dart';

class PictureFrame extends StatelessWidget {
  const PictureFrame(
      {this.completion,
      this.imagesIs,
      this.targetText,
      this.targetCompletion,
      this.titleText,
      super.key});
  final String? imagesIs;
  final String? titleText;
  final String? targetText;
  final double? completion;
  final String? targetCompletion;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: const EdgeInsets.only(top: 5, bottom: 5, right: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: AssetImage(
                imagesIs ?? "assets/images/intro2.png",
              ),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              titleText ?? "",
              style: const TextStyle(
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
                  color: Colors.grey.shade300, // Empty part (grey background)
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              // Filled part (half-filled with theme color)
              FractionallySizedBox(
                widthFactor: completion ?? 0.5, // Half-filled
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  targetText ?? "",
                  style: const TextStyle(
                      fontFamily: "Poppins", fontWeight: FontWeight.bold),
                ),
                Text(
                  targetCompletion ?? "",
                  style: const TextStyle(
                      color: AppColor.themeColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

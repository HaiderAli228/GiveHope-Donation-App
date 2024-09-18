import 'package:flutter/material.dart';

import 'app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key, required this.buttonText, required this.onPressed});
  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 55,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 30),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: AppColor.themeColor, borderRadius: BorderRadius.circular(6)),
        child: Text(
          buttonText,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 19),
        ),
      ),
    );
  }
}

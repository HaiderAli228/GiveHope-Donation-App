import 'package:flutter/material.dart';

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
}

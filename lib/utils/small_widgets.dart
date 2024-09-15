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
}

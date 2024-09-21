import 'package:flutter/material.dart';

import 'app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controllerIs;
  final TextInputType keyboardApperanceType;
  final String? hintTextIs;
  final IconData? suffixIconIs;
  final IconData? prefixIconIs;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode; // Add this for moving focus to the next field

  const CustomTextField({super.key,
    required this.controllerIs,
    required this.keyboardApperanceType,
    this.hintTextIs,
    this.suffixIconIs,
    this.prefixIconIs,
    required this.focusNode,
    this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerIs,
      keyboardType: keyboardApperanceType,
      focusNode: focusNode,
      textInputAction: nextFocusNode != null ? TextInputAction.next : TextInputAction.done,
      onFieldSubmitted: (_) {
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintTextIs ?? "",
        hintStyle: const TextStyle(color: Colors.grey, fontFamily: "Poppins"),
        filled: true,
        fillColor: AppColor.lightColor,
        suffixIcon: Icon(
          suffixIconIs,
          color: Colors.grey,
        ),
        prefixIcon: Icon(
          prefixIconIs,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColor.lightColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColor.lightColor),
        ),
      ),
    );
  }
}

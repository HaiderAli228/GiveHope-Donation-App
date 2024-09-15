import 'package:flutter/material.dart';

import 'app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {this.keyboardApperanceType,
      required this.controllerIs,
      required this.prefixIconIs,
      this.hintTextIs,
      this.suffixIconIs,
      super.key});
  final TextEditingController controllerIs;
  final IconData? suffixIconIs;
  final IconData prefixIconIs;
  final TextInputType? keyboardApperanceType;
  final String? hintTextIs;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerIs,
      keyboardType: keyboardApperanceType,
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
              borderSide: BorderSide(color: AppColor.lightColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColor.lightColor))),
    );
  }
}

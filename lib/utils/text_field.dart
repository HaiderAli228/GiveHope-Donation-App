import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart'
    as validator; // Alias to avoid conflict

import 'app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controllerIs;
  final TextInputType keyboardApperanceType;
  final String? hintTextIs;
  final IconData? suffixIconIs;
  final IconData? prefixIconIs;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final validator.FormFieldValidator<String>?
      fieldValidator; // Use the alias for the validator

  const CustomTextField({
    super.key,
    required this.controllerIs,
    required this.keyboardApperanceType,
    this.hintTextIs,
    this.suffixIconIs,
    this.prefixIconIs,
    required this.focusNode,
    this.nextFocusNode,
    this.fieldValidator, // Allow passing validators
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerIs,
      keyboardType: keyboardApperanceType,
      validator:
          fieldValidator, // Use the validator provided via the constructor
      focusNode: focusNode,

      textInputAction:
          nextFocusNode != null ? TextInputAction.next : TextInputAction.done,
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

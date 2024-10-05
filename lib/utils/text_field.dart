import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart' as validator;

import 'app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controllerIs;
  final TextInputType keyboardApperanceType;
  final String? hintTextIs;
  final IconData? suffixIconIs;
  final IconData? prefixIconIs;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final validator.FormFieldValidator<String>? fieldValidator;

  const CustomTextField({
    super.key,
    required this.controllerIs,
    required this.keyboardApperanceType,
    this.hintTextIs,
    this.suffixIconIs,
    this.prefixIconIs,
    required this.focusNode,
    this.nextFocusNode,
    this.fieldValidator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerIs,
      keyboardType: keyboardApperanceType,
      validator: fieldValidator,
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
        enabledBorder: _buildBorder(AppColor.lightColor),
        focusedBorder: _buildBorder(AppColor.lightColor),
        errorBorder: _buildBorder(AppColor.lightColor),
        focusedErrorBorder: _buildBorder(AppColor.lightColor),
        errorStyle: const TextStyle(height: 0), // To hide error text below field if needed
      ),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: color),
    );
  }
}

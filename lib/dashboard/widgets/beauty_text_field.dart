import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BeautyTextField extends StatelessWidget {
  BeautyTextField({
    Key? key,
    required this.fieldName,
    this.textInputType = TextInputType.url,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  final String fieldName;
  final TextInputType? textInputType;
  TextInputAction? textInputAction;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obscureText;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        validator: (text) {
          if (text!.isEmpty) {
            return "This Field is required";
          }
          return null;
        },
        scrollPadding: const EdgeInsets.all(50),
        keyboardType: textInputType,
        textInputAction: textInputAction,
        maxLines: null,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 2.0,
            ),
          ),
          border: const OutlineInputBorder(borderSide: BorderSide(width: 2.0)),
          label: Text(fieldName),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        obscureText: obscureText,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
  });
  final IconData? prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: Colors.grey[400]),
        suffixIcon: suffixIcon,
        filled: true,
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder().copyWith(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
        ),
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: Styles.textStyle14.copyWith(
          color: const Color(0xFFC5CEE0),
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          fontFamily: "Inter",
        ),
        contentPadding: EdgeInsets.only(
          top: 14,
          bottom: 14,
          left: 48,
          right: 16,
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.transparent),
    );
  }
}

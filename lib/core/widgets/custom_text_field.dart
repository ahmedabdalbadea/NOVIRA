import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.onChanged,
  });
  final IconData? prefixIcon;
  final String hintText;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is required";
        } else {
          return null;
        }
      },
      decoration: _getInputDecoration(),
    );
  }

  InputDecoration _getInputDecoration() {
    return InputDecoration(
      prefixIcon: Icon(prefixIcon, color: Colors.grey[400]),
      filled: true,
      border: _buildBorder(),
      enabledBorder: _buildBorder(),
      focusedBorder: _buildBorder().copyWith(
        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
      ),
      errorBorder: _buildBorder().copyWith(
        borderSide: BorderSide(color: Colors.redAccent, width: 2),
      ),

      focusedErrorBorder: _buildBorder().copyWith(
        borderSide: BorderSide(color: Colors.redAccent, width: 2),
      ),
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: _getHintStyle(),
      contentPadding: EdgeInsets.only(top: 14, bottom: 14, left: 48, right: 16),
    );
  }

  TextStyle _getHintStyle() {
    return Styles.textStyle14.copyWith(
      color: const Color(0xFFC5CEE0),
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      fontFamily: "Inter",
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.transparent),
    );
  }
}

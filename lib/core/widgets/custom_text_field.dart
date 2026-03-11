import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
  });
  final IconData? prefixIcon;
  final String hintText;
  final IconData? suffixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return TextField(obscureText: clicked, decoration: getInputDecoration());
  }

  InputDecoration getInputDecoration() {
    return InputDecoration(
      prefixIcon: Icon(widget.prefixIcon, color: Colors.grey[400]),
      suffixIcon: IconButton(
        onPressed: () {
          clicked = clicked == false ? true : false;
          setState(() {});
        },
        icon: Icon(
          clicked ? Icons.visibility_off_outlined : widget.suffixIcon,
          color: Colors.grey[400],
        ),
      ),
      filled: true,
      border: _buildBorder(),
      enabledBorder: _buildBorder(),
      focusedBorder: _buildBorder().copyWith(
        borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2),
      ),
      fillColor: Colors.white,
      hintText: widget.hintText,
      hintStyle: getHintStyle(),
      contentPadding: EdgeInsets.only(top: 14, bottom: 14, left: 48, right: 16),
    );
  }

  TextStyle getHintStyle() {
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

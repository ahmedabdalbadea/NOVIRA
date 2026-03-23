import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.prefixIcon,
    required this.hintText,
    this.onChanged,
    this.isPassword = false,
    required this.validator,
  });
  final IconData? prefixIcon;
  final String hintText;
  final void Function(String)? onChanged;
  final bool isPassword;
  final String? Function(String?)? validator;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? hide : false,
      onChanged: widget.onChanged,
      // validator: (value) {
      //   if (value?.isEmpty ?? true) {
      //     return "Field is required";
      //   } else {
      //     return null;
      //   }
      // },
      validator: widget.validator,
      decoration: _getInputDecoration(),
    );
  }

  InputDecoration _getInputDecoration() {
    return InputDecoration(
      suffixIcon: widget.isPassword
          ? IconButton(
              onPressed: () {
                setState(() {
                  hide = hide ? false : true;
                });
              },
              icon: Icon(
                hide
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.grey[400],
              ),
            )
          : null,
      prefixIcon: Icon(widget.prefixIcon, color: Colors.grey[400]),
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
      hintText: widget.hintText,
      hintStyle: _getHintStyle(),
      contentPadding: const EdgeInsets.only(
        top: 14,
        bottom: 14,
        left: 48,
        right: 16,
      ),
    );
  }

  TextStyle _getHintStyle() {
    return Styles.textStyle14.copyWith(
      color: const Color(0xFFC5CEE0),
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      fontFamily: kInter,
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}

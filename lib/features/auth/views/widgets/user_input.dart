import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_text_field.dart';

class UserInput extends StatelessWidget {
  const UserInput({
    super.key,
    required this.lable,
    this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
  });
  final String lable;
  final IconData? prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable, style: Styles.textStyle14.copyWith(color: kDesTextColor)),
        const SizedBox(height: 8),
        CustomTextField(
          prefixIcon: prefixIcon,
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
      ],
    );
  }
}

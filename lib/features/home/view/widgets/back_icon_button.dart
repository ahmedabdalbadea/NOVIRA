import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_back, color: kDesTextColor),
      ),
    );
  }
}

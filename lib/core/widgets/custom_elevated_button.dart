import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.gradient,
    required this.title,
    this.onPressed,
  });
  final Gradient? gradient;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    // We use a Container because
    //ElevatedButton doesn't support gradients natively
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: gradient,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // Transparent background
          //allows the Container's gradient to show through
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: Styles.textStyle16.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

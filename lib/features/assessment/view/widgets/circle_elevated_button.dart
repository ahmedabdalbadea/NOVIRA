import 'package:flutter/material.dart';

class CircleElevatedButton extends StatelessWidget {
  const CircleElevatedButton({super.key, required this.child, this.onPressed});
  final Widget child;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(16),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

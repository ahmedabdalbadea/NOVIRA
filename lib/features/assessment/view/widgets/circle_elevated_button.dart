import 'package:flutter/material.dart';

class CircleElevatedButton extends StatelessWidget {
  const CircleElevatedButton({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(16),
      ),
      onPressed: () {},
      child: child,
    );
  }
}

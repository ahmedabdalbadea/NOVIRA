import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';

class BottomAppBarItem extends StatelessWidget {
  const BottomAppBarItem({
    super.key,
    required this.label,
    required this.icon,
    this.isActive = false,
  });
  final String label;
  final IconData icon;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: isActive ? kEndSecGradientColor.withValues(alpha: 0.19) : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive
                ? kStartSecGradientColor.withValues(alpha: .8)
                : kDesTextColor,
            size: 30,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Styles.textStyle12.copyWith(
              color: isActive
                  ? kStartSecGradientColor.withValues(alpha: .8)
                  : kDesTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    this.isChoicen = false,
    required this.title,
    required this.value,
  });
  final bool isChoicen;
  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation.drive(
              Tween<double>(
                begin: 0.96,
                end: 1.0,
              ).chain(CurveTween(curve: Curves.easeOutCubic)),
            ),
            child: child,
          ),
        );
      },
      child: isChoicen
          ? ChoicenAnswer(
              key: const ValueKey('selected'),
              title: title,
              value: value,
            )
          : UnChoicenAnswer(
              key: const ValueKey('unselected'),
              title: title,
              value: value,
            ),
    );
  }
}

class ChoicenAnswer extends StatelessWidget {
  const ChoicenAnswer({super.key, required this.title, required this.value});
  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kEndSecGradientColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFC8E6C9), width: 1.5),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18),
        leading: Icon(Icons.radio_button_checked, color: kEndSecGradientColor),
        title: Text(
          title,
          style: Styles.textStyle16.copyWith(
            color: const Color(0xFF003366),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class UnChoicenAnswer extends StatelessWidget {
  const UnChoicenAnswer({super.key, required this.title, required this.value});
  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18),
        leading: Icon(Icons.radio_button_unchecked, color: Colors.grey),
        title: Text(
          title,
          style: Styles.textStyle16.copyWith(color: kDesTextColor),
        ),
      ),
    );
  }
}

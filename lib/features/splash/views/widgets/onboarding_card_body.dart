import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';

class OnboardingCardBody extends StatelessWidget {
  const OnboardingCardBody({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width * 0.90,
      padding: EdgeInsets.all(32),
      decoration: _buildDecoration(),
      child: body,
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      boxShadow: _shadows,
      color: kPrimaryColor,
      borderRadius: BorderRadius.circular(24),
    );
  }

  List<BoxShadow> get _shadows {
    return [
      BoxShadow(
        color: Color(0xFFE0E0E0).withValues(alpha: 0.5),
        blurRadius: 20,
        offset: Offset(0, 8),
      ),
    ];
  }
}

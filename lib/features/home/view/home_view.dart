import 'package:flutter/material.dart';
import 'package:novira_app/core/widgets/gradient_scaffold.dart';
import 'package:novira_app/features/home/view/widgets/custom_navigation_bar.dart';
import 'package:novira_app/features/home/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: SafeArea(bottom: false, child: HomeViewBody()),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novira_app/core/utils/app_router.dart';

void main() {
  runApp(const NoviraApp());
}

class NoviraApp extends StatelessWidget {
  const NoviraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.nunitoTextTheme()),
    );
  }
}

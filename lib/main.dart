import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const NoviraApp());
}

class NoviraApp extends StatelessWidget {
  const NoviraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false);
  }
}

import 'package:flutter/material.dart';
import 'package:ram_mandir_timeline/constants/colors.dart';

import 'screens/navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ram Mandir',
      theme: ThemeData.dark().copyWith(
          primaryColor: CustomColors.primaryColor,
          scaffoldBackgroundColor: CustomColors.scaffoldBg),
      home: const NavigationScreen(),
    );
  }
}

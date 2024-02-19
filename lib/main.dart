import 'package:flutter/material.dart';
import 'package:nh_korindo_mts/ui/splashscreen/splash_screen.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff286cb4)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}


import 'package:bali_travel/screens/detail_screen.dart';
import 'package:bali_travel/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:bali_travel/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bali Travel',
      debugShowCheckedModeBanner:
          false, // Menghilangkan pita "DEBUG" di pojok kanan atas
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      // Di sinilah kita memanggil layar pertama Anda
      home: SplashScreen(),
    );
  }
}

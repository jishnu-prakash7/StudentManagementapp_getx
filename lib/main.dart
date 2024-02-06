import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management/presentation/screen_home/screen_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        buttonTheme: const ButtonThemeData(buttonColor: Colors.green),
        fontFamily: GoogleFonts.titilliumWeb().fontFamily,
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 143, 142, 144),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

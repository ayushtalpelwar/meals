import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/screen/tabs.dart';

final theme=ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.latoTextTheme(),
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
    )
);



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home:TabsScreen(),
    );
  }
}

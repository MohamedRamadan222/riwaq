import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riwaq/features/home/presentation/pages/main_screen.dart';
import 'features/details/presentation/pages/book_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riwaq',
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(),
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      ),
      home: MainScreen(),
    );
  }
}

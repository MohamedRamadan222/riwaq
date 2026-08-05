import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riwaq/features/onboarding/presentation/pages/on_boarding_screen.dart';
import 'package:riwaq/features/onboarding/presentation/pages/splash_screen.dart';
import 'core/di/injection_container.dart' as di;
import 'package:hive_flutter/adapters.dart';
import 'package:riwaq/features/home/presentation/pages/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await di.initInjection();

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
      home: SplashScreen(),
    );
  }
}

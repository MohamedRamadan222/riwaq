import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riwaq/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:riwaq/features/onboarding/presentation/pages/splash_screen.dart';
import 'core/di/injection_container.dart' as di;
import 'package:hive_flutter/adapters.dart';
import 'package:riwaq/features/home/presentation/pages/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await di.initInjection();

  final bool isLoggedIn = di.sl<AuthLocalDataSource>().hasCachedUser();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riwaq',
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(),
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      ),
      home: isLoggedIn ? const MainScreen() : const SplashScreen(),
    );
  }
}

import 'package:dash_shooter/loading/view/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashShooterApp extends StatelessWidget {
  const DashShooterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dash Shooter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF425084),
        appBarTheme: const AppBarTheme(color: Color(0xFF425084)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF425084),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF425084)),
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const LoadingPage(),
    );
  }
}

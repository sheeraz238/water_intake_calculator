import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0A1628)),
          scaffoldBackgroundColor: Color(0xFF0A1628),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF0A1628),
            foregroundColor: Colors.white,
          ),
        ),
        home: InputPage(),
      ),
    );
  }
}

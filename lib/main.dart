import 'package:curency_converter_app_ismail/screens/curency_list_main_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curency Converter App',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 40,
            fontFamily: 'Urbanist',
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            fontSize: 24,
            fontFamily: 'Urbanist',
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontFamily: 'Urbanist',
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: TextStyle(
            fontSize: 15,
            fontFamily: 'Urbanist',
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          titleSmall: TextStyle(
            fontSize: 12,
            fontFamily: 'Urbanist',
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const CurencyListMainUI(),
    );
  }
}

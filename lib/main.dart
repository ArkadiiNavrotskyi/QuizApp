import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

// The main entry point of the Quiz Application.
void main() {
  runApp(const MyApp());
}

// The root widget of the application.
// This widget is stateless and sets up
// the main MaterialApp configuration.


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:test3/views/start_quiz_view.dart';

void main() {
  runApp(const LearningApp());
}

class LearningApp extends StatelessWidget {
  const LearningApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xE5060B26),
      ),
      home: const StartQuizView(),
    );
  }
}

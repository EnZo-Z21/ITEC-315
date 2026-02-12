import 'package:flutter/material.dart';
import 'package:quiz_app_sp26/questions_screen.dart';
import 'package:quiz_app_sp26/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override

  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen();
    });
  }

  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 63, 8, 165),
          Color.fromARGB(255, 12, 1, 39)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        )
      ),
          child: activeScreen,
        ),
      ),
    );
  }
}
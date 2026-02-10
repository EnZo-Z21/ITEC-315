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
  void switchScreen() {
    Widget? activeScreen;
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
    return activeScreen!;
  }
}
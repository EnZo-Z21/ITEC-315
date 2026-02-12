import 'package:flutter/material.dart';
import 'package:quiz_app_sp26/answer_button.dart';
import 'package:quiz_app_sp26/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Text('The questions will go here',
          style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          const SizedBox(height: 30),
          AnswerButton(answerText: "Answer 1", onTap: (){}),
          AnswerButton(answerText: "Answer 2", onTap: (){}),
          AnswerButton(answerText: "Answer 3", onTap: (){}),
          AnswerButton(answerText: "Answer 4", onTap: (){}),
        ],
      ),
    );
  }
}
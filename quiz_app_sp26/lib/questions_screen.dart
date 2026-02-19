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
    final currentQuestion = questions[0];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentQuestion.question,
          style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 30),
          ...currentQuestion.answers.map((item){
            return AnswerButton(
              answerText: item, 
              onTap: () {},
            );
          }),
        ],
      ),
    );
  }
}
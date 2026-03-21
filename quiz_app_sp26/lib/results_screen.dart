import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_sp26/data/questions.dart';
import 'package:quiz_app_sp26/questions_summary.dart';
class ResultsScreen extends StatelessWidget{
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData(){
    List<Map<String, Object>> summary = [];
    for(var i=0; i<chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question':questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }


  @override
  Widget build(context)
  {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numTotalCorrect = summaryData.where(
      (data){
      return data['correct_answer'] == data['user_answer'];
    }
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              'You answered $numTotalCorrect out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height:30,),
             SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: QuestionsSummary(summaryData: summaryData),
              ),
             ),
            const SizedBox(height:30,),
            TextButton(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
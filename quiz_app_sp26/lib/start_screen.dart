import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context){
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/quiz-logo.png', width: 280, color: Color.fromARGB(200, 255, 255, 255),),
          
            Text("Challenge yourself on this quiz!", style: TextStyle(color:Colors.white, fontSize:22)
            ),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: startQuiz,
              icon:const Icon(Icons.arrow_circle_right_outlined),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,),
              label: Text("Start Quiz"),
            ),
          ],
        ),
    );
  }
}
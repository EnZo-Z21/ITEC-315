import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 63, 8, 165),
          Color.fromARGB(255, 12, 1, 39)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        )
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/quiz-logo.png', width: 280),
          
            Text("Challenge yourself on this quiz!", style: TextStyle(color:Colors.white, fontSize:28)
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {}, 
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,),
              child: Text("Start Quiz"),
            ),
          ],
        ),
    );
  }
}
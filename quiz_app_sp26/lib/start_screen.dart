import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(BuildContext context){
    //TODO: implement build
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 63, 8, 165),
          Color.fromARGB(255, 12, 1, 39)
        ])
      ),
      child: Center(child: Text("Start Quiz"),),
    );
  }
}
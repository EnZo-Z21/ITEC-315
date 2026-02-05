import 'package:dice_roller/centered_text.dart';
import 'package:dice_roller/dice_roller.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer(this.startAlignment, this.endAlignment, {super.key});

  Alignment startAlignment;
  Alignment endAlignment;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 63, 8, 165),
            Color.fromARGB(255, 12, 1, 39),
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: DiceRoller()
      ),
    );
  }
}
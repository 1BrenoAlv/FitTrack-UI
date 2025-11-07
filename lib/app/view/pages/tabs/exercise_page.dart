import 'package:fittrack_ui/app/view/widgets/exercises/card_exercises.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Exercícios'),
          Text('exercícios disponiveis'),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                CardExercises(),
                CardExercises(),
                CardExercises(),
                CardExercises(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

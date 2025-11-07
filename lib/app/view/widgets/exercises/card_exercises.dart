import 'package:fittrack_ui/app/view/const/colors_const.dart';
import 'package:flutter/material.dart';

class CardExercises extends StatelessWidget {
  const CardExercises({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: ColorsConst.colorContainerMarks,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color.fromARGB(24, 255, 255, 255)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.grey),
            child: Icon(Icons.run_circle_outlined),
          ),
          Text('Polichinelo'),
          Text('Cardio'),
        ],
      ),
    );
  }
}

import 'package:fittrack_ui/app/view/const/alerts/alert_initial.dart';
import 'package:fittrack_ui/app/view/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTrainingDay extends StatelessWidget {
  const CardTrainingDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(
        gradient: ColorsConst.colorContainerTraining,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Treino do dia',
                style: GoogleFonts.workSans(
                  color: const Color.fromARGB(232, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Text(
                'Cardio Intenso',
                style: GoogleFonts.workSans(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                '30 min - Corpo Todo - Queime 300 cal',
                style: GoogleFonts.workSans(
                  color: const Color.fromARGB(232, 0, 0, 0),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          FloatingActionButton.small(
            onPressed: () {
              AlertInitial.alertTextEmpty(
                context,
                'Treino Iniciado 💪',
                'Imagine que o seu treino iniciou!',
              );
            },
            backgroundColor: const Color.fromARGB(255, 11, 182, 19),
            elevation: 0,
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.black,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

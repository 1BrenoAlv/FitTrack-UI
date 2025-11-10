import 'package:fittrack_ui/app/view/const/colors_const.dart';
import 'package:fittrack_ui/app/view/widgets/exercises/enum/rank_exercise.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardExercises extends StatelessWidget {
  const CardExercises({
    super.key,
    required this.nameExercise,
    required this.typeExercise,
    required this.rankExercise,
    required this.tempExercise,
    required this.calExercise,
    this.onNavigate,
    required this.iconExercise,
  });

  final String nameExercise;
  final String typeExercise;
  final RankExercise rankExercise;
  final int tempExercise;
  final int calExercise;
  final String iconExercise;
  final Function(int)? onNavigate;

  @override
  Widget build(BuildContext context) {
    String text;
    Color colorBack;

    switch (rankExercise) {
      case RankExercise.iniciante:
        text = 'Iniciante';
        colorBack = Colors.green;
        break;
      case RankExercise.inter:
        text = 'Inter.';
        colorBack = Colors.amber;
        break;
      case RankExercise.avancado:
        text = 'Avançado';
        colorBack = Colors.red;
        break;
    }

    return Container(
      decoration: BoxDecoration(
        gradient: ColorsConst.colorContainerMarks,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color.fromARGB(24, 255, 255, 255)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(28, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(iconExercise, style: TextStyle(fontSize: 27)),
              ),
            ),
            const SizedBox(height: 10),

            Text(
              nameExercise,
              style: GoogleFonts.workSans(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  typeExercise,
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.normal,
                    color: const Color.fromARGB(108, 255, 255, 255),
                    fontSize: 12,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                    color: colorBack,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    text,
                    style: GoogleFonts.workSans(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.timer, color: Colors.purple[300], size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$tempExercise s',
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.normal,
                        color: const Color.fromARGB(108, 255, 255, 255),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.orange[400],
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$calExercise cal',
                      style: GoogleFonts.workSans(
                        color: const Color.fromARGB(108, 255, 255, 255),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fittrack_ui/app/view/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardExercises extends StatelessWidget {
  const CardExercises({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: ColorsConst.colorContainerMarks,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color.fromARGB(24, 255, 255, 255)),
      ),
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
              child: const Icon(
                Icons.run_circle_outlined,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Polichinelo',
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cardio',
                          style: GoogleFonts.workSans(
                            fontWeight: FontWeight.normal,
                            color: const Color.fromARGB(108, 255, 255, 255),
                            fontSize: 12,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Iniciante',
                            style: GoogleFonts.workSans(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: Colors.purple[300],
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '30s',
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
                              '80 cal',
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
            ],
          ),
        ],
      ),
    );
  }
}

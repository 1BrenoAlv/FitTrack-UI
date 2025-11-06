import 'package:fittrack_ui/app/view/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWeekly extends StatelessWidget {
  const CardWeekly({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Atividade Semanal',
          style: GoogleFonts.workSans(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: ColorsConst.colorContainerMarks,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: const Color.fromARGB(24, 255, 255, 255)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              WeekChart(day: 'Seg', progress: 30.0),
              WeekChart(day: 'Ter', progress: 40.0),
              WeekChart(day: 'Qua', progress: 27.0),
              WeekChart(day: 'Qui', progress: 50.0),
              WeekChart(day: 'Sex', progress: 40.0),
              WeekChart(day: 'Sáb', progress: 29.0),
              WeekChart(day: 'Dom', progress: 25.0),
            ],
          ),
        ),
      ],
    );
  }
}

class WeekChart extends StatelessWidget {
  const WeekChart({super.key, required this.progress, required this.day});

  final double progress;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: progress,
          width: 27.0,
          decoration: BoxDecoration(
            gradient: ColorsConst.colorContainerTraining, // Cor de fundo
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          day,
          style: GoogleFonts.workSans(
            color: const Color.fromARGB(158, 255, 255, 255),
          ),
        ),
      ],
    );
  }
}

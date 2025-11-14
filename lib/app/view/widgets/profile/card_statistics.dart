import 'package:fittrack_ui/app/view/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardStatisticsProfile extends StatelessWidget {
  const CardStatisticsProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: ColorsConst.colorContainerMarks,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color.fromARGB(24, 255, 255, 255)),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Info(infoName: 'Treinos', infoValue: '42'),
            Info(infoName: 'Calorias', infoValue: '1.2k'),
            Info(infoName: 'Dias Ativos', infoValue: '15'),
          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({super.key, required this.infoValue, required this.infoName});

  final String infoValue;
  final String infoName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          infoValue,
          style: GoogleFonts.workSans(
            color: const Color.fromARGB(255, 8, 178, 221),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          infoName,
          style: GoogleFonts.workSans(
            color: const Color.fromARGB(195, 255, 255, 255),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

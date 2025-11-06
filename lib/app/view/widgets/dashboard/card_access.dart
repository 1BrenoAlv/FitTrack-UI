import 'package:fittrack_ui/app/view/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardAccess extends StatelessWidget {
  const CardAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Acesso Rápido',
          style: GoogleFonts.workSans(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CardOption(
                iconButton: Icons.fitness_center,
                nameDirection: 'Exercícios',
                iconColor: Colors.blue,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: CardOption(
                iconButton: Icons.restaurant,
                nameDirection: 'Exercícios',
                iconColor: Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CardOption extends StatelessWidget {
  const CardOption({
    super.key,
    required this.nameDirection,
    required this.iconButton,
    required this.iconColor,
  });

  final String nameDirection;
  final IconData iconButton;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: ColorsConst.colorContainerMarks,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color.fromARGB(24, 255, 255, 255)),
      ),
      child: Column(
        children: [
          Icon(iconButton, color: iconColor),
          SizedBox(height: 5),
          Text(
            nameDirection,
            style: GoogleFonts.workSans(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

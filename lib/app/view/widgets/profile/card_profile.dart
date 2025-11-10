import 'package:fittrack_ui/app/view/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: ColorsConst.colorContainerTraining,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: Text(
              'BA',
              style: GoogleFonts.workSans(
                color: const Color.fromARGB(255, 8, 178, 221),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Breno Alves de Queiroz',
            style: GoogleFonts.workSans(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'breno.alves@email.com',
            style: GoogleFonts.workSans(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

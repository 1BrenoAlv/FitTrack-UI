import 'package:fittrack_ui/app/view/const/colors_const.dart';
import 'package:fittrack_ui/app/view/widgets/profile/card_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: ColorsConst.colorBack),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Perfil',
                style: GoogleFonts.workSans(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              CardProfile(),
              Text(
                'PAGE EM DESENVOLVIMENTO......',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

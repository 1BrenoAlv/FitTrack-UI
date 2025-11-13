import 'package:fittrack_ui/app/view/const/alerts/alert_initial.dart';
import 'package:fittrack_ui/app/view/const/colors_const.dart';
import 'package:fittrack_ui/app/view/widgets/exercises/enum/rank_exercise.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageExercises extends StatelessWidget {
  const PageExercises({super.key, this.onNavigate, required this.exercise});

  final Map<String, dynamic> exercise;
  final Function(int)? onNavigate;

  @override
  Widget build(BuildContext context) {
    String rankText;
    Color rankColor;

    switch (exercise['rankExercise'] as RankExercise) {
      case RankExercise.iniciante:
        rankText = 'Iniciante';
        rankColor = Colors.green;
        break;
      case RankExercise.inter:
        rankText = 'Intermediário';
        rankColor = Colors.amber;
        break;
      case RankExercise.avancado:
        rankText = 'Avançado';
        rankColor = Colors.red;
        break;
    }

    final List<String> muscles =
        (exercise['muscles'] as List<dynamic>?)?.cast<String>() ?? [];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            stretch: true,
            backgroundColor: const Color.fromARGB(255, 8, 178, 221),
            leading: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: const Color.fromARGB(137, 0, 0, 0),
                iconSize: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
                if (onNavigate != null) {
                  onNavigate!(1);
                }
              },
              icon: Icon(Icons.arrow_back),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: Text(
                  exercise['iconExercise'],
                  style: TextStyle(fontSize: 100),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise['nameExercise'],
                    style: GoogleFonts.workSans(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      TypeExercise(
                        type: exercise['typeExercise'],
                        colorBg: Color(0xFF2A2D3E),
                        colortxt: Colors.white,
                      ),
                      SizedBox(width: 10),
                      TypeExercise(
                        type: rankText,
                        colorBg: rankColor,
                        colortxt: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CardInfo(
                    calExercise: exercise['calExercise'],
                    tempExercise: exercise['tempExercise'],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Instruções',
                    style: GoogleFonts.workSans(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    exercise['instructions'] ?? 'Instruções não disponíveis!!',
                    style: GoogleFonts.workSans(
                      color: Colors.grey[400],
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Músculos Afetados',
                    style: GoogleFonts.workSans(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      for (int i = 0; i < muscles.length; i++) ...[
                        CardMuscles(training: muscles[i]),
                        if (i < muscles.length - 1) SizedBox(height: 10),
                      ],
                    ],
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      AlertInitial.alertTextEmpty(
                        context,
                        'Treino Iniciado 💪',
                        'Imagine que o seu treino iniciou!',
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: double.maxFinite,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow, color: Colors.black),
                          SizedBox(width: 10),
                          Text(
                            'Iniciar Exercício',
                            style: GoogleFonts.workSans(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TypeExercise extends StatelessWidget {
  const TypeExercise({
    super.key,
    required this.type,
    required this.colorBg,
    required this.colortxt,
  });
  final String type;
  final Color colorBg;
  final Color colortxt;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colorBg,
      ),
      child: Text(
        type,
        style: GoogleFonts.workSans(
          color: colortxt,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({
    super.key,
    required this.tempExercise,
    required this.calExercise,
  });

  final int tempExercise;
  final int calExercise;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: ColorsConst.colorContainerMarks,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color.fromARGB(24, 255, 255, 255)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.timer, color: Color.fromARGB(255, 8, 178, 221)),
              Text(
                '$tempExercise s',
                style: GoogleFonts.workSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                'Duração',
                style: GoogleFonts.workSans(
                  color: Colors.grey[400],
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 70,
            child: VerticalDivider(
              color: const Color.fromARGB(69, 255, 255, 255),
              thickness: 1,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.local_fire_department, color: Colors.orange[400]),
              Text(
                '$calExercise',
                style: GoogleFonts.workSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                'Calorias',
                style: GoogleFonts.workSans(
                  color: Colors.grey[400],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardMuscles extends StatelessWidget {
  const CardMuscles({super.key, required this.training});

  final String training;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: ColorsConst.colorContainerMarks,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(24, 255, 255, 255)),
      ),
      width: double.maxFinite,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(Icons.verified, color: const Color.fromARGB(255, 8, 178, 221)),
          SizedBox(width: 10),
          Text(
            training,
            style: GoogleFonts.workSans(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

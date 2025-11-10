import 'package:fittrack_ui/app/view/const/colors_const.dart';
import 'package:fittrack_ui/app/view/widgets/dashboard/card_access.dart';
import 'package:fittrack_ui/app/view/widgets/dashboard/card_statistics.dart';
import 'package:fittrack_ui/app/view/widgets/dashboard/card_training_day.dart';
import 'package:fittrack_ui/app/view/widgets/dashboard/card_weekly.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, this.onNavigate});

  final Function(int)? onNavigate;

  @override
  Widget build(BuildContext context) {
    final String name = ModalRoute.of(context)!.settings.arguments as String;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(gradient: ColorsConst.colorBack),

      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            toolbarHeight: 80,
            actionsPadding: EdgeInsets.all(20.0),
            elevation: 0,

            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Olá $name👋',
                  style: GoogleFonts.workSans(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Pronto para treinar?',
                  style: GoogleFonts.workSans(
                    fontSize: 13,
                    color: const Color.fromARGB(162, 255, 255, 255),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CardTrainingDay(), 
                  const SizedBox(height: 20),
                  Row(
                    // Section Mark
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CardStatistics(
                          titleStatistics: 'Passos',
                          amountStatistics: '7.842',
                          markStatistics: 'Meta: 10.000',
                          iconStatistics: Icons.directions_run_rounded,
                          iconColorStatistics: Colors.purple,
                          progress: 0.78,
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: CardStatistics(
                          titleStatistics: 'Calorias',
                          amountStatistics: '425',
                          markStatistics: 'Meta: 600 Kcal',
                          iconStatistics: Icons.local_fire_department,
                          iconColorStatistics: Colors.orange,
                          calStatistics: 'kcal',
                          progress: 0.7,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CardWeekly(), 
                  const SizedBox(height: 20),
                  CardAccess(onNavigate: onNavigate),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

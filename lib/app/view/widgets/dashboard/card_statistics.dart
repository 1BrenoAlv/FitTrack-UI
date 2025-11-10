import 'package:fittrack_ui/app/view/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardStatistics extends StatelessWidget {
  const CardStatistics({
    super.key,
    required this.titleStatistics,
    required this.amountStatistics,
    required this.markStatistics,
    required this.iconStatistics,
    required this.iconColorStatistics,
    required this.progress,
    this.calStatistics,
  });

  final String titleStatistics;
  final String amountStatistics;
  final String markStatistics;
  final String? calStatistics;
  final IconData iconStatistics;
  final Color iconColorStatistics;
  final double? progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: ColorsConst.colorContainerMarks,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color.fromARGB(24, 255, 255, 255)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(iconStatistics, color: iconColorStatistics),
              SizedBox(width: 5),
              Text(
                titleStatistics,
                style: GoogleFonts.workSans(
                  color: const Color.fromARGB(193, 255, 255, 255),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                amountStatistics,
                style: GoogleFonts.workSans(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              calStatistics != null
                  ? Text(
                      calStatistics!,
                      style: GoogleFonts.workSans(
                        color: const Color.fromARGB(144, 255, 255, 255),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
          if (progress != null) ...[
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6.0,
                backgroundColor: Color.fromARGB(255, 11, 27, 48),
                valueColor: AlwaysStoppedAnimation(
                  const Color.fromARGB(255, 8, 178, 221),
                ),
              ),
            ),
          ],
          SizedBox(height: 5),
          Text(
            markStatistics,
            style: GoogleFonts.workSans(
              color: const Color.fromARGB(144, 255, 255, 255),
              fontSize: 12,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}

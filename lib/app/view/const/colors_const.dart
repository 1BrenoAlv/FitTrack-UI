import 'package:flutter/widgets.dart';

class ColorsConst {
  static const Gradient colorBack = LinearGradient(
    // APP BACKGROUND COLOR
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    colors: [Color.fromARGB(255, 10, 15, 22), Color.fromARGB(255, 3, 20, 51)],
  );

  static const Gradient colorContainerTraining = LinearGradient(
    // BACKGROUND COLOR CONTAINER DASHBOARD PAGE
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    colors: [Color.fromARGB(255, 6, 146, 189), Color.fromARGB(255, 9, 90, 212)],
  );

  static const Gradient colorContainerMarks = LinearGradient(
    // BACKGROUND COLOR CARD MARK DASHBOARD PAGE
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF2A2D3E), Color.fromARGB(255, 35, 37, 49)],
  );
}

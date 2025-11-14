import 'package:fittrack_ui/app/view/pages/tabs/dashboard_page.dart';
import 'package:fittrack_ui/app/view/pages/tabs/exercise_page.dart';
import 'package:fittrack_ui/app/view/pages/initial_page.dart';
import 'package:fittrack_ui/app/view/pages/navigator_bar.dart';
import 'package:fittrack_ui/app/view/pages/tabs/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(textTheme: GoogleFonts.workSansTextTheme()),
      initialRoute: '/',
      routes: {
        '/': (context) => const InitialPage(),
        '/exercise': (context) => const ExercisePage(),
        '/dashboard': (context) => const DashboardPage(),
        '/home': (context) => const NavigatorBar(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

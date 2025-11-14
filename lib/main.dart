import 'package:fittrack_ui/app/view/pages/splash_page.dart';
import 'package:fittrack_ui/app/view/pages/initial_page.dart';
import 'package:fittrack_ui/app/view/pages/navigator_bar.dart';
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
        '/': (context) => const SplashPage(),
        '/initial': (context) => const InitialPage(),
        '/navigator': (context) => const NavigatorBar(),
      },
    );
  }
}

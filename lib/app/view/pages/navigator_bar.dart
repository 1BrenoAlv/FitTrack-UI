import 'package:fittrack_ui/app/view/const/colors_const.dart';
import 'package:fittrack_ui/app/view/pages/tabs/dashboard_page.dart';
import 'package:fittrack_ui/app/view/pages/tabs/exercise_page.dart';
import 'package:fittrack_ui/app/view/pages/tabs/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int _selectedIndex = 0;

  late final List<Widget> _widgetOptions = <Widget>[
    DashboardPage(onNavigate: _onItemTapped),
    ExercisePage(onNavigate: _onItemTapped),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _widgetOptions.elementAt(_selectedIndex),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          gradient: ColorsConst.colorContainerMarks,
          borderRadius: BorderRadiusDirectional.vertical(
            top: Radius.circular(5),
          ),
        ),

        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors
                .transparent, // esse 2 serve para tirar aquele efeito de clicar da navegacao bar
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: GoogleFonts.workSans(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            unselectedLabelStyle: GoogleFonts.workSans(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
            selectedIconTheme: IconThemeData(size: 25),
            unselectedIconTheme: IconThemeData(size: 20),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center),
                label: 'Exercícios',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

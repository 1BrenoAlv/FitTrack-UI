import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fittrack_ui/app/view/const/alerts/alert_initial.dart';
import 'package:fittrack_ui/app/view/const/colors_const.dart';
import 'package:fittrack_ui/app/view/const/images_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final TextEditingController _textController = TextEditingController();
  final String name = '';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: ColorsConst.colorBack),

        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),

            child: Container(
              padding: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(59, 10, 86, 173),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: const Color.fromARGB(122, 10, 86, 173),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Digite seu nome',
                        textStyle: GoogleFonts.workSans(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        speed: Duration(milliseconds: 150),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                  SizedBox(height: 30),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.asset(
                          ImagesConst.imageInitial,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(14, 0, 0, 0),
                              ),
                              width: 300,
                              height: (300 / 16 * 9),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  TextField(
                    controller: _textController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Seu nome aqui",
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(58, 255, 255, 255),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          final String name = _textController.text.trim();
                          if (name.isEmpty) {
                            AlertInitial.alertTextEmpty(
                              context,
                              'Campo Vazio!',
                              'Você deve escrever um nome para continuar!',
                            );
                          } else {
                            Navigator.pushReplacementNamed(
                              context,
                              '/home',
                              arguments: name,
                            );
                          }
                        },
                        icon: Icon(Icons.send, color: Colors.white70),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(58, 255, 255, 255),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

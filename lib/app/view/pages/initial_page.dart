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

  void nameUser() {
    if (_textController.text.trim().isEmpty) {
      AlertInitial.alertTextEmpty(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HOme')),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: ColorsConst.colorBack),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Digite seu nome',
                    textStyle: GoogleFonts.workSans(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
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
                // FEITO UM EFEITO BORRADO NA FRENTE DA IMAGEM
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
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      nameUser();

                      Navigator.pushNamed(context, '/dashboard');
                    },
                    icon: Icon(Icons.send),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

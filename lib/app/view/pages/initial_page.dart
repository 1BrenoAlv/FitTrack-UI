import 'dart:ui'; // Para o BackdropFilter (fundo)

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

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _submitName() {
    final String name = _textController.text.trim();
    if (name.isEmpty) {
      AlertInitial.alertTextEmpty(
        context,
        'Campo Vazio!',
        'Você deve escrever um nome para continuar!',
      );
    } else {
      Navigator.pushReplacementNamed(context, '/navigator', arguments: name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagesConst.imageInitial),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(color: const Color.fromARGB(164, 0, 0, 0)),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'FIT TRACK',
                    style: GoogleFonts.workSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      gradient: ColorsConst.colorContainerMarks,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: const Color.fromARGB(24, 255, 255, 255),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Como podemos te chamar?',
                          style: GoogleFonts.workSans(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Seu nome será usado para personalizar seu perfil.',
                          style: GoogleFonts.workSans(
                            fontSize: 14.0,
                            color: Colors.grey[400],
                          ),
                        ),
                        SizedBox(height: 24),
                        Form(
                          child: Column(
                            children: [
                              TextField(
                                controller: _textController,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Seu nome",
                                  hintStyle: TextStyle(
                                    color: const Color.fromARGB(
                                      118,
                                      255,
                                      255,
                                      255,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                        58,
                                        255,
                                        255,
                                        255,
                                      ),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 8, 178, 221),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 24),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    8,
                                    178,
                                    221,
                                  ),
                                  minimumSize: const Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: _submitName,
                                child: Text(
                                  'Continuar',
                                  style: GoogleFonts.workSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

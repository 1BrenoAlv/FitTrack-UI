import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertInitial {
  static Future alertTextEmpty(
    BuildContext context,
    String title,
    String content,
  ) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF2A2D3E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),

        // --- 2. ESTILO DO TÍTULO ---
        title: Text(
          title,
          style: GoogleFonts.workSans(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        // --- 3. ESTILO DO CONTEÚDO ---
        content: Text(
          content,
          style: GoogleFonts.workSans(color: Colors.white),
        ),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'OK',
              style: GoogleFonts.workSans(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

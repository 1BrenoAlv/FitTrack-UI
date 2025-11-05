// WARNING IN EMPTY TEXT
import 'package:flutter/material.dart';

class AlertInitial {
  static Future alertTextEmpty(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Nome não enviado!'),
        content: Text('Esse conteúdo não pode estar vazio'),

        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}

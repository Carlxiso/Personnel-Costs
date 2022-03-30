import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeBtn extends StatelessWidget {
  // const AdaptativeBtn({Key? key}) : super(key: key);

  //Parâmetros
  final String label;
  final Function() onPressed;
  // Contructor que vai receber parâmetros nomeados
  AdaptativeBtn({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: onPressed,
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
          )
        : ElevatedButton(
            child: Text(label),
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: Colors.pinkAccent,
              onPrimary: Colors.white,
            ));
  }
}

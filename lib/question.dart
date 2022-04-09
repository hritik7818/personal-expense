// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//Creating our owm custom widget.

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 24,
          color: Colors.teal,
          backgroundColor: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

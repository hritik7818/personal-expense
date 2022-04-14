// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, deprecated_member_use

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final score;
  final VoidCallback resetHandler;
  Result(this.score, this.resetHandler);

  String get resultText {
    String result;
    if (score <= 20) {
      result = "You are awesome and innocent";
    } else if (score <= 30) {
      result = "You are pretty nicer";
    } else if (score <= 40) {
      result = "You are strange";
    } else {
      result = "You are bad";
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultText,
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              "Reset Quiz",
              style: TextStyle(fontSize: 20),
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}

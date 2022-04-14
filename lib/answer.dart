// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

//  creating custom answer button widget
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // creating a variable to take a callback function
  // that function has an implementation of setState().
  // this phenomena is known as state pushing.
  // because we can change state, from that widget we don't have that state.

  //  variable declared with final keyword is a run-time constant.
  // its means variable can not be changed in run time of our flutter app.

  //  variable declared with const keyword is a compile-time constant (compile-time constant value of also a run-time constant).
  // its means variable can not be changed in compile time of our flutter app

  //Note: we can also define constant value in Right Hand Side.
  // var a = const ["red","blur","green"];
  // which mean value in right hand side is immutable (unchangeable).
  //a.push("white") is wrong.

  final selectHandler; //declaring run-time constant value.
  final Map<String, Object> buttonData;

  Answer({required this.selectHandler, required this.buttonData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      child: RaisedButton(
        color: Colors.blueAccent,
        child: Text(
          buttonData["text"] as String,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () => selectHandler(buttonData["score"]),
      ),
    );
  }
}

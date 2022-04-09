// ignore_for_file: prefer_const_constructors, deprecated_member_use

//  creating custom answer button widget
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // creating a variable to take a callback function
  // that function has an implementation of setState().
  // this phenomena is known as state pushing.
  // because we can change state, from that widget we don't have that state.

  final VoidCallback selectHandler;
  final String buttonText;

  Answer({required this.selectHandler, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      child: RaisedButton(
        color: Colors.blueAccent,
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: selectHandler,
      ),
    );
  }
}

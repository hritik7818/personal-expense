// ignore_for_file: prefer_const_constructors, deprecated_member_use

//  creating custom answer button widget
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      child: RaisedButton(
        child: Text("Answer 1"),
        onPressed: null,
      ),
    );
  }
}

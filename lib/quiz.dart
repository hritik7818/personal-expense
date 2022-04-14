// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import "package:flutter/material.dart";

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final handleAnswer;

  Quiz({
    required this.questions,
    required this.questionIndex,
    required this.handleAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          // Flutter will not consider or not rely that _questions[_questionIndex]["question"] has a string value.
          // To Tell the Flutter _questions[_questionIndex]["question"] has a String value we have to write like this (as String)

          // Note - null safety
          // In Current versions of flutter the null safety is enabled. we have to aware of it.
          // null safety means when we pass a data to same function or constructor, flutter will not understand the type of data and assume it may be null and give error.
          // to resolve this issue , we that variable null acceptable which receives value.
          // or make simple variable and give a value with a mark and mark is an exclamation mark (!) which show it's not a null value .
          // or define the type of value when sending a data to same function or constructor
          // we can define type by using -> as {{data_type}} ex- as int.

          questions[questionIndex]["question"] as String,
        ),

        // Map Method is iterate on all the elements of the List and return a new list.
        // as it return a list , as children takes a list and here we put list inside a list ,we want a single list.
        //so we use  spreed Operator (...). spreed Operator remove all element of List and put all value of list as a individual elements.
        ...(questions[questionIndex]["answer"] as List<Map<String, Object>>)
            .map((answerData) => Answer(
                  selectHandler: handleAnswer,
                  buttonData: answerData,
                ))
            .toList()
      ],
    );
  }
}

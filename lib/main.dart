// ignore_for_file: deprecated_member_use, prefer_const_constructors

// importing "material.dart" because it has a some build-in widgets and functions such as statelessWidget,Text,runApp function and many more.
import "package:flutter/material.dart";

//all data of question.dart file is accessible by import it.
import "./quiz.dart";
import "./result.dart";

// main function is an entry point for the application.
void main() {
  // runApp function is given by material.dart it takes a root widget to render a widget on the screen and it automatically run the build method of the root widget.
  runApp(MyApp());
}

// Creating a widget
// We can create a widget by creating a class that extends or inherited the statelessWidget or statefulWidget
// we can create stateless Widget (widget without state) by inhered statelessWidget class.
// we can create stateful Widget (widget with state) by inhered statefulWidget class.

// Those widget is create for the purpose of output or display something on the screen and that widget does not change its properties we make them stateless, it is created by extends StatelessWidget.

// Those widget is create for the purpose of output or display something on the screen and that widget can change its properties when user interact we make them stateful, it is created by extends StatefulWidget.

// stateless widget is created by simply create a single class which extends statelessWidget.

// stateless widget is created by create a two classes -
// first class extends statelessWidget and has override function "createState" which return a object or widget of state class.
// second class extends State with generic type of first class and in this class we can use setState() method. setState method accept an anonymous function.

// In That widget setState() method is called ,the build method of that widget is called again.when user interact with UI ,to make changes in our UI ,we make changes in properties of widgets in setState() method so that build method runs again with updated properties.so UI Updates.

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = [
    {
      "question": "What is Your Favorite Color",
      "answer": [
        {
          "text": "Blue",
          "score": 10,
        },
        {
          "text": "Black",
          "score": 30,
        },
        {
          "text": "Red",
          "score": 15,
        },
        {
          "text": "Green",
          "score": 5,
        },
      ],
    },
    {
      "question": "What is Your Favorite Sport",
      "answer": [
        {
          "text": "Tennis",
          "score": 10,
        },
        {
          "text": "Cricket",
          "score": 5,
        },
        {
          "text": "Football",
          "score": 5,
        },
        {
          "text": "Badminton",
          "score": 10,
        },
      ],
    },
    {
      "question": "What is Your Favorite Car",
      "answer": [
        {
          "text": "Lamborghini",
          "score": 5,
        },
        {
          "text": "Audi",
          "score": 5,
        },
        {
          "text": "Ferrari",
          "score": 5,
        },
        {
          "text": "BMW",
          "score": 5,
        },
      ],
    },
    {
      "question": "What is Your Hobby",
      "answer": [
        {
          "text": "Singing",
          "score": 10,
        },
        {
          "text": "Dancing",
          "score": 5,
        },
        {
          "text": "Writing",
          "score": 5,
        },
        {
          "text": "Playing",
          "score": 5,
        },
      ],
    },
  ];
  int _totalScore = 0;
  void _handleAnswer(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  void _resetHandler() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
  // Note:
  // When use or define a widget we basically create an object of a class (widget) and in that class their is a build method which is automatically called by the flutter and it return a widget that is displayed on the screen.

  // all widget implementations should must have the build method it is automatically called by the flutter and it return a widget that is displayed on the screen.
  // build method takes one argument context which has a type of class BuildContext , context has a metadata about the Widget like where it is exist in widget tree.
  @override
  Widget build(BuildContext context) {
    // MaterialApp widget is a main widget. It make some setup to render the widget on the screen.
    // Text widget is displays text on the screen.
    return MaterialApp(
      // Scaffold widget is used to implementing a basic layout and styling on screen.
      home: Scaffold(
        // appBar named argument takes a AppBar widget which create an AppBar on the Top of the screen.
        appBar: AppBar(
          title: const Text("My First App"),
        ),
        // Body named argument take a widget which is rendered on the main screen.

        // their are some visible widgets and some invisible widgets.
        // like Text, AppBar, RaisedButton they all are visible widget, they are use to display some content on the display
        // we also have some invisible widgets which are used to structure our visible widgets and give layout to it.
        // Column widget is a type of invisible widget it is used for give structure (in column wise/vertically) to our visible widgets which are Text and RaisedButton widget .

        //Note - we can use ternary operator for render Widget conditionally.
        //     - we can also use map method for render Multiple Widget iteratively.
        body: _questionIndex < _questions.length
            ? Quiz(
                handleAnswer: _handleAnswer,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetHandler),
      ),
    );
  }
}

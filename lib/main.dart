// ignore_for_file: deprecated_member_use, prefer_const_constructors

// importing "material.dart" because it has a some build-in widgets and functions such as statelessWidget,Text,runApp function and many more.
import "package:flutter/material.dart";

//all data of question.dart file is accessible by import it.
import "./question.dart";
import "./answer.dart";

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
// first class extends statelessWidget and has override function createState which return a object or widget on state class.
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

  void _handleAnswer() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  // Note:
  // When use or define a widget we basically create an object of a class (widget) and in that class their is a build method which is automatically called by the flutter and it return a widget that is displayed on the screen.

  // all widget implementations should must have the build method it is automatically called by the flutter and it return a widget that is displayed on the screen.
  // build method takes one argument context which has a type of class BuildContext , context has a metadata about the Widget like where it is exist in widget tree.
  @override
  Widget build(BuildContext context) {
    var _questions = [
      "What is Your Favorite Color",
      "What is Your Favorite Sport",
    ];
    // MaterialApp widget is a main widget. It make some setup to render the widget on the screen.
    // Text widget is displays text on the screen.
    return MaterialApp(
      // Scaffold widget is used to implementing a basic layout and styling on screen.
      home: Scaffold(
        // appBar named argument takes a AppBar widget which create an AppBar on the Top of the screen.
        appBar: AppBar(
          title: const Text("My First App"),
        ),
        // Body named argument take a widget which is rendered on the screen.
        // their are some visible widgets and some invisible widgets.
        // like Text ,AppBar , RaisedButton they all are visible widget ,they are use to display some content on the display
        // we also have some invisible widgets which are used to structure our visible widgets and give layout to it.
        // Column widget is a type of invisible widget it is used for give structure (in column wise/vertically) to our visible widgets which are Text and RaisedButton widget .
        body: Column(
          children: [
            Question(
              _questions[_questionIndex],
            ),
            RaisedButton(
              child: Text("Answer 1"),
              // onPressed takes a function which has to be execute when the user press on this button.
              // we should not be call the function here because when flutter read this flutter will call immediately.

              // we can pass function to one onPressed in two ways:
              // 1 - by define declared function name without parenthesis on onPressed using we point to the function not call it.
              // 2 - by define anonymous function to the onPressed.

              // assigning declared function name without parenthesis to onPressed.
              onPressed: _handleAnswer,
            ),
            RaisedButton(
              child: Text("Answer 2"),

              // assigning anonymous function to onPressed.
              onPressed: () {
                setState(() {
                  _questionIndex++;
                });
                print("Answer 2");
              },
            ),
            RaisedButton(
              child: Text("Answer 3"),
              onPressed: () {
                setState(() {
                  _questionIndex++;
                });
                print("Answer 3");
              },
            ),
          ],
        ),
      ),
    );
  }
}

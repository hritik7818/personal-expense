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
  final _questions = [
    {
      "question": "What is Your Favorite Color",
      "answer": [
        "Blue",
        "Black",
        "Red",
        "Green",
      ],
    },
    {
      "question": "What is Your Favorite Sport",
      "answer": [
        "Tennis",
        "Cricket",
        "Football",
        "Badminton",
      ],
    },
    {
      "question": "What is Your Favorite Car",
      "answer": [
        "Lamborghini",
        "Audi",
        "Ferrari",
        "BMW",
      ],
    },
    {
      "question": "What is Your Hobby",
      "answer": [
        "Singing",
        "Dancing",
        "Writing",
        "Playing",
      ],
    },
  ];

  void _handleAnswer() {
    setState(() {
      _questionIndex++;
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
        // Body named argument take a widget which is rendered on the screen.
        // their are some visible widgets and some invisible widgets.
        // like Text ,AppBar , RaisedButton they all are visible widget ,they are use to display some content on the display
        // we also have some invisible widgets which are used to structure our visible widgets and give layout to it.
        // Column widget is a type of invisible widget it is used for give structure (in column wise/vertically) to our visible widgets which are Text and RaisedButton widget .

        //Note - we can use ternary operator for render Widget conditionally.
        //     - we can also use map method for render Multiple Widget iteratively.
        body: _questionIndex < _questions.length
            ? Column(
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

                    _questions[_questionIndex]["question"] as String,
                  ),

                  // Map Method is iterate on all the elements of the List and return a new list.
                  // as it return a list , as children takes a list and here we put list inside a list ,we want a single list.
                  //so we use  spreed Operator (...). spreed Operator remove all element of List and put all value of list as a individual elements.
                  ...(_questions[_questionIndex]["answer"] as List<String>)
                      .map((e) => unchangeable(
                            selectHandler: _handleAnswer,
                            buttonText: e,
                          ))
                      .toList()
                ],
              )
            : Center(
                child: Text(
                  "You did it !",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
      ),
    );
  }
}

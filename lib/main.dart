//* importing "material.dart" because it has a some build-in widgets and functions such as statelessWidget,Text,runApp function and many more.
import "package:flutter/material.dart";

//* main function is an entry point for the application.
void main() {
  //* runApp function is given by material.dart it takes a root widget to render a widget on the screen and it automatically run the build method of the root widget.
  runApp(MyApp());
}

//* Creating a stateless widget
class MyApp extends StatelessWidget {
  //* all widget implementations should must have the build method it is automatically called by the flutter and it return a widget that is displayed on the screen.
  @override
  Widget build(BuildContext context) {
    //* MaterialApp widget is a main widget. It make some setup to render the widget on the screen.
    //* Text widget is displays text on the screen.
    return MaterialApp(home: Text("Hello World !"));
  }
}

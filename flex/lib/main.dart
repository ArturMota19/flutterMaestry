import 'package:flutter/material.dart';

void main() => runApp(const FlexStudy());

class FlexStudy extends StatelessWidget {

  const FlexStudy({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible & Expanded',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // IMPORTANT NOTE:
  // The Flexible widget must be a descendant of a Row, Column, or Flex
  // widget, and the path from the Flexible widget to its enclosing Row,
  // Column, or Flex must contain only StatelessWidgets or StatefulWidgets.
  // If this is not the case, then the Flexible widget will not work.
  // Expanded is a shorthand for Flexible with tight fit.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible & Expanded'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.red,
            child: const Text('Item 1 - pretty big!'),
          ),
          // Flexible tight will take up the remaining space
          Flexible(
            fit: FlexFit.tight,
            // work the same as fr in css
            flex: 2,
            child: Container(
              height: 100,
              color: Colors.blue,
              child: const Text('Item 2'),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: Container(
              height: 100,
              color: Colors.orange,
              child: const Text('Item 3'),
            ),
          ),
        ],
      ),
    );
  }
}

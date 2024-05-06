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
          Container(
            height: 100,
            color: Colors.blue,
            child: const Text('Item 2'),
          ),
          Container(
            height: 100,
            color: Colors.orange,
            child: const Text('Item 3'),
          ),
        ],
      ),
    );
  }
}

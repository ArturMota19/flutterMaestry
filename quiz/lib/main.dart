import 'package:flutter/material.dart';

main (){
  runApp(const QuizApp());
}

final List<String> questions = [
  "Who wanted to steal the philosopher's stone??",
  "What is Harry Potter's father's name?",
  "Who is Harry Potter's arch enemy (at Hogwarts)",
];

class QuizApp extends StatelessWidget{
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: Column(
          children: <Widget>[
            Text(questions[0]),
            ElevatedButton(
              onPressed: (){},
              child: Text('Voldemort'),
            ),
            ElevatedButton(
              onPressed: (){},
              child: Text('Quirrell'),
            ),
            ElevatedButton(
              onPressed: (){},
              child: Text('Quirrell and Voldemort'),
            ),
          ]
        ),
      ),
    );
  }
}


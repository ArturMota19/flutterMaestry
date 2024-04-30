import 'package:flutter/material.dart';

main (){
  runApp(const QuizApp());
}

final List<String> questions = [
  "Who wanted to steal the philosopher's stone??",
  "What is Harry Potter's father's name?",
  "Who is Harry Potter's arch enemy (at Hogwarts)",
];

void answerQuestion(){
  print('Answer chosen!');
}

void Function() anonymousFunctionAnswer() {
  return () {
    print('Answer #2 chosen!');
  };
}

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
              onPressed: (){
                // create a function that will be called when the button is pressed
                print('First answer chosen!');
              },
              child: Text('Voldemort'),
            ),
            ElevatedButton(
              onPressed: anonymousFunctionAnswer(),
              child: Text('Quirrell'),
            ),
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text('Quirrell and Voldemort'),
            ),
          ]
        ),
      ),
    );
  }
}


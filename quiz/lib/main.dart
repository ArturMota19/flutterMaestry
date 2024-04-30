import 'package:flutter/material.dart';
import './question.dart';

main (){
  runApp(QuizApp());
}

final List<String> questions = [
  "Who wanted to steal the philosopher's stone??",
  "What is Harry Potter's father's name?",
  "Who is Harry Potter's arch enemy (at Hogwarts)",
];
class QuizAppState extends State<QuizApp> {
  var selectedQuestion = 0;

  void answerQuestion(){
    setState(() {
      selectedQuestion++;
    });
    print('Answer chosen!');
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[selectedQuestion]),
            ElevatedButton(
              onPressed: answerQuestion,
              child: Text('Voldemort'),
            ),
            ElevatedButton(
              onPressed: answerQuestion,
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
class QuizApp extends StatefulWidget{
  
  State<QuizApp> createState(){
    return QuizAppState();
  }

  
}


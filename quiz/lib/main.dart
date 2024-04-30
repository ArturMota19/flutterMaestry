import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

main (){
  runApp(QuizApp());
}

final List<Map<String, Object>> questions = [
  {
    'text': 'Who is the main antagonist in the Harry Potter series?',
    'answers': ['Voldemort', 'Dumbledore', 'Hermione', 'Sirius Black'],
  },
  {
    'text': 'Who is Harry Potter\'s father?',
    'answers': ['James Potter', 'Sirius Black', 'Remus Lupin', 'Peter Pettigrew'],
  },
  {
    'text': 'Who is Harry Potter\'s rival in Slytherin?',
    'answers': ['Draco Malfoy', 'Crabbe', 'Goyle', 'Pansy Parkinson'],
  }
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
            SizedBox(height: 200),
            Question(questions[selectedQuestion]['text'].toString()),
            Answer((questions[selectedQuestion]['answers'] as List)[0].toString(), answerQuestion),
            Answer((questions[selectedQuestion]['answers'] as List)[1].toString(), answerQuestion),
            Answer((questions[selectedQuestion]['answers'] as List)[2].toString(), answerQuestion),
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


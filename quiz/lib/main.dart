import 'package:flutter/material.dart';
import './result.dart';
import './questionary.dart';

main (){
  runApp(QuizApp());
}

const questions = [
  {
    'text': 'Who is the main antagonist in the Harry Potter series?',
    'answers': [
      {'text': 'Voldemort', 'points': 10},
      {'text': 'Dumbledore', 'points': 0},
      {'text': 'Hermione', 'points': 0}, 
      {'text': 'Sirius Black', 'points': 0}
     ],
  },
  {
    'text': 'Who is Harry Potter\'s father?',
    'answers': [
      {'text': 'James Potter', 'points': 10},
      {'text': 'Sirius Black', 'points': 0},
      {'text': 'Remus Lupin', 'points': 0}, 
      {'text': 'Peter Pettigrew', 'points': 0}
    ],
  },
  {
    'text': 'Who is Harry Potter\'s rival in Slytherin?',
    'answers': [
      {'text': 'Draco Malfoy', 'points': 10},
      {'text': 'Crabbe', 'points': 0},
      {'text': 'Goyle', 'points': 0}, 
      {'text': 'Pansy Parkinson', 'points': 0}
    ],
  }];
class QuizAppState extends State<QuizApp> {
  var selectedQuestion = 0;
  var totalPoints = 0;


  bool get hasQuestionSelected{
    return selectedQuestion < questions.length;
  }
  
  void _answerQuestion(int points){
    if(hasQuestionSelected){
      setState(() {
        selectedQuestion++;
        totalPoints += points;
      });
    }
  }



  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: hasQuestionSelected ? 
        Questionary(questions: questions, selectedQuestion: selectedQuestion, answerQuestion: _answerQuestion)
         :
        Result(totalPoints)
        ,
      ),
    );
  }
}
class QuizApp extends StatefulWidget{
  
  State<QuizApp> createState(){
    return QuizAppState();
  }

  
}


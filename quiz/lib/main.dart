import 'package:flutter/material.dart';

main (){
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: Text('Olá, mundo mobile! xD'),
       ),
    );
  }
}
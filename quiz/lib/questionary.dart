import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
class Questionary extends StatelessWidget {


  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function () answerQuestion;

  const Questionary({
    super.key,
    required this.questions,
    required this.selectedQuestion,
    required this.answerQuestion,

    
    });
    bool get hasQuestionSelected{
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasQuestionSelected ? questions[selectedQuestion]['answers'] as List<Map<String, Object>> : [];
    // List<Widget> widgets = answers.map((textAnswer) => Answer(textAnswer.toString(), answerQuestion)).toList();
    return Column(
          children: <Widget>[
            Question(questions[selectedQuestion]['text'].toString()),
            ...answers
            .map((answ) => Answer(answ['text'] as String, answerQuestion))
          ]
    );
  }
}
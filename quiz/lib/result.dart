import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result(this.totalPoints, {super.key});
  String get resultPhrase {
    if (totalPoints < 10) {
      return "Did you even read the books?!";
    } else if (totalPoints < 20) {
      return "Nice try, Dobby!";
    } else if (totalPoints < 30) {
      return "Oh, so close! Mione would be disgusted";
    } else {
      return "Ok, like... Did you studied at Hogwarts or something?";
    }
  }
  final int totalPoints;

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Text(
              resultPhrase,
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
        ); 
  }
}
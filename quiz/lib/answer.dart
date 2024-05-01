import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final String text;
  final void Function() onSelection;

  const Answer(this.text, this.onSelection, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 1.0,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple),
            padding: MaterialStateProperty.all(EdgeInsets.all(20)),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25)),
            foregroundColor: MaterialStateProperty.all(Colors.white)
          ),
          onPressed: onSelection,
          child: Text(text),
        ),
    );
}
}
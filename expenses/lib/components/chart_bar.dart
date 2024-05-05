import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.label, required this.spendingAmount, required this.percentual});

  final String label;
  final double spendingAmount;
  final double percentual;

  @override
  Widget build(BuildContext context) {

    var totalCost = 40.0; 
    totalCost -= spendingAmount;
    totalCost = totalCost < 0 ? totalCost * -1 : totalCost * -1;

    var newPercentual = percentual;
    if(percentual > 40.0) {
      newPercentual = 1.0;
    }
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text('R''\$${totalCost.toStringAsFixed(0)}'),
        ),
        SizedBox(
          height: 4.0,
        ),
        Container(
          height: 60.0,
          width: 10.0,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              SizedBox(
                child: FractionallySizedBox(
                  heightFactor: newPercentual,
                  child: Container(
                    decoration: BoxDecoration(
                      color: totalCost < 0 ? Colors.red : Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(label),
      ],
    );
  }
}
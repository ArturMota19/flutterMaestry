import 'package:expenses/components/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/rides.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentRides,  {super.key});

  final List<Rides> recentRides;

List<Map<String, Object>> get groupedRides {
  return List.generate(7, (index) {
    final weekDay = DateTime.now().subtract(
      Duration(days: 6 -index),
    );

    double totalSum = 0.0;

    for (var i = 0; i < recentRides.length; i++) {
      bool sameDay = recentRides[i].date.day == weekDay.day;
      bool sameMonth = recentRides[i].date.month == weekDay.month;
      bool sameYear = recentRides[i].date.year == weekDay.year;

      if (sameDay && sameMonth && sameYear) {
        totalSum +=
            recentRides[i].passengers.values.reduce((value, element) => value + element);
      }
    }
    return {
      'day': DateFormat.EEEE().format(weekDay)[0], 'amount': totalSum,
    };
  });
}

  @override
  Widget build(BuildContext context) {
    groupedRides;
    return Card(
      elevation: 6.0,
      margin: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedRides.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
              label: '${data['day']}', 
              spendingAmount: data['amount'] as double, 
              percentual: (40.0 - (data['amount'] as double)) > 0 ? (40.0 - (data['amount'] as double)) / 40.0 : -1 * (40.0 - (data['amount'] as double)) / 40.0,
            ),
          );
        }).toList(),
      ),
    );
  }
}
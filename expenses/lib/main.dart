import 'package:expenses/models/rides.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './models/rides.dart';

void main() {
  runApp(const RideExpensesApp());
}

class RideExpensesApp extends StatelessWidget {
  const RideExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ride Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final _rides = [
    Rides(id: '0', passangers: {'Alice': 1.0, 'Bob': 2.0, 'Carlos': 1.0}  , date: DateTime.now()),
    Rides(id: '0', passangers: {'Artur': 2.0, 'Boss': 2.0, 'Claudia': 1.0}  , date: DateTime.now()),
  ];

double totalAmount(Rides ride) {
  double total = 0.0;
  for (var value in ride.passangers.values) {
    total += value;
  }
  return total;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Ride Expenses'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.purple,
              elevation: 5.0,
              child: Text('Graph goes here'),
            ),
          ),
          const SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.purple,
              elevation: 5.0,
              child: Text('Expenses goes here'),
            ),
          ),
          Column(
            children: _rides.map((ride) => Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(totalAmount(ride).toString())
                    ],
                  ),
                  Column(
                    children: [
                      Text(ride.passangers.keys.toString()),
                      Text(ride.date.toString())
                    ],
                  ),
                ],
              )
            )).toList(),
          )
        ],
      )
    );
  }
}
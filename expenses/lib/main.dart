import 'package:expenses/models/rides.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './models/rides.dart';
import 'package:intl/intl.dart';

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
          Column(
            children: _rides.map((ride) => Card(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2.0,
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'R\$: ${totalAmount(ride).toString()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ride.passangers.keys.toString().replaceAll('(', '').replaceAll(')', ''),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),

                      ),
                      Text(
                        DateFormat('dd/MM/yyyy').format(ride.date),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                        
                        )
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
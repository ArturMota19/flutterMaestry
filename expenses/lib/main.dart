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
    Rides(id: '0', title: 'New Ride1', amount: 6.0, date: DateTime.now()),
    Rides(id: '1', title: 'New Ride2', amount: 5.0, date: DateTime.now()),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Ride Expenses'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.purple,
              elevation: 5.0,
              child: Text('Graph goes here'),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.purple,
              elevation: 5.0,
              child: Text('Expenses goes here'),
            ),
          ),
        ],
      )
    );
  }
}
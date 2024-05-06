import 'package:expenses/components/chart.dart';
import 'package:expenses/components/rides_form.dart';
import 'package:expenses/components/rides_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:expenses/models/rides.dart';
import 'dart:math';

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
      theme: ThemeData(
        // primarySwatch: receive a color,
        // primarySwatch: receive a MaterialColor object (interval of colors),
        primaryColor: Color.fromARGB(255, 4, 41, 56),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
            fontSize: 13.0,
            color: Colors.grey,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            fontSize: 12.0,
            color: Colors.red,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          labelLarge: const TextStyle(
            fontSize: 20.0,
            color: Colors.purple,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          labelMedium: const TextStyle(
            fontSize: 12.0,
            color: Colors.white,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
        ),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Rides> _rides = [
    Rides(id: '0', passengers: {'Artur': 22.0, 'Bob': 2.0, 'Carol': 5.0}  , date: DateTime.now().subtract(const Duration(days: 1))),
    Rides(id: '1', passengers: {'Alisson': 2.0, 'Bruno': 34.0, 'Coralina': 5.0}  , date: DateTime.now().subtract(const Duration(days: 1))),
    Rides(id: '2', passengers: {'Ambrosia': 4.0, 'Breno': 2.0, 'Celia': 5.0}  , date: DateTime.now().subtract(const Duration(days: 4))),
    Rides(id: '3', passengers: {'Amélia': 9.0, 'Bosh': 2.0, 'Cap': 12.0}  , date: DateTime.now().subtract(const Duration(days: 30))),
  ];

  List<Rides> get _recentRides {
    return _rides.where((ride) {
      return ride.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  _addRide(Map<String, double> passengers) {
    final newRide = Rides(
      id: Random().nextDouble().toString(),
      passengers: passengers,
      date: DateTime.now(),
    );

    setState(() {
      _rides.add(newRide);
    });

    Navigator.of(context).pop();
  }
  _openRideModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return RidesForm(_addRide);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Ride Expenses',
          style: Theme.of(context).textTheme.titleLarge,

          ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Chart(_recentRides),
            Column(
              children: <Widget>[
                RidesList(_recentRides),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openRideModal(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}
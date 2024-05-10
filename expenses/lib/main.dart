import 'package:expenses/components/chart.dart';
import 'package:expenses/components/rides_form.dart';
import 'package:expenses/components/rides_list.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
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
    
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);

    return MaterialApp(
      title: 'Ride Expenses',
      home: MyHomePage(),
      theme: ThemeData(
        // primarySwatch: receive a color,
        // primarySwatch: receive a MaterialColor object (interval of colors),
        primaryColor: Color.fromARGB(255, 4, 41, 56),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: 20 * MediaQuery.of(context).textScaler.scale(1.0),
            color: Colors.black,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 13 * MediaQuery.of(context).textScaler.scale(1.0),
            color: Colors.grey,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            fontSize: 12 * MediaQuery.of(context).textScaler.scale(1.0),
            color: Colors.red,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          labelLarge: TextStyle(
            fontSize: 20 * MediaQuery.of(context).textScaler.scale(1.0),
            color: Colors.purple,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          labelMedium: TextStyle(
            fontSize: 12 * MediaQuery.of(context).textScaler.scale(1.0),
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
    Rides(
      id: 'r1',
      passengers: {
        'John': 1.0,
        'Mary': 5.0,
        'Peter': 3.0,
      },
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Rides(
      id: 'r2',
      passengers: {
        'John': 1.0,
        'Mary': 50.0,
        'Peter': 30.0,
      },
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    

  ];
  bool _showChart = false;
  List<Rides> get _recentRides {
    return _rides.where((ride) {
      return ride.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  _addRide(Map<String, double> passengers, DateTime date) {
    final newRide = Rides(
      id: Random().nextDouble().toString(),
      passengers: passengers,
      date: date,
    );

    setState(() {
      _rides.add(newRide);
    });

    Navigator.of(context).pop();
  }

  _deleteRide(String id){
    setState(() {
      _rides.removeWhere((ride) => ride.id == id);
    });
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
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Ride Expenses',
          style: Theme.of(context).textTheme.titleLarge,

          ),
        actions: <Widget>[
          if(isLandscape)
            IconButton(
              icon: Icon(_showChart ? Icons.list : Icons.show_chart),
              onPressed: () {
                setState(() {
                  _showChart = !_showChart;
                });
              },
            ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _openRideModal(context);
            },
          ),

        ],
      );

    final availableHeight = MediaQuery.of(context).size.height 
    - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if(_showChart || !isLandscape)
            Container(
              height: isLandscape ? availableHeight * 0.7 : availableHeight * 0.3,
              child: Chart(_recentRides)
              ),
            if(!_showChart || !isLandscape)
              Container(
              height: availableHeight * 0.70,
              child: RidesList(_rides, _deleteRide)
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
import 'package:flutter/material.dart';
import './rides_list.dart';
import './rides_form.dart';
import '../models/rides.dart';

class RidesUser extends StatefulWidget {
  const RidesUser({super.key});

  @override
  State<RidesUser> createState() => _RidesUserState();
}

class _RidesUserState extends State<RidesUser> {
  final _rides = [
    Rides(id: '0', passangers: {'Alice': 1.0, 'Bob': 2.0, 'Carlos': 1.0}  , date: DateTime.now()),
    Rides(id: '0', passangers: {'Artur': 2.0, 'Boss': 2.0, 'Claudia': 1.0}  , date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          width: double.infinity,
          child: Card(
            color: Colors.purple,
            elevation: 5.0,
            child: Text('Graph goes here'),
          ),
        ),
        RidesList(_rides),
        RidesForm(),
      ],
    );
  }
}
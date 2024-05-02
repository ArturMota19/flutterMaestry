import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/rides.dart';

class RidesList extends StatelessWidget {
  const RidesList(this.rides, {super.key});

  final List<Rides> rides;
  
  double totalAmount(Rides ride) {
  double total = 0.0;
  for (var value in ride.passangers.values) {
    total += value;
  }
  return total;
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: rides.map((ride) => Card(
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
    );
  }
}
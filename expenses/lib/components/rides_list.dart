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
    return Container(
      height: 600.0,
      child: rides.isEmpty ? Column(
        children: <Widget>[
          const SizedBox(height: 20.0),
          Text(
            'No rides added yet!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20.0),
          Container(
            height: 200.0,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ) :
       ListView.builder(
        itemCount: rides.length,
        itemBuilder: (ctx, index){
          final ride = rides[index];
          return Card(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'R\$: ${totalAmount(ride).toString()}',
                    style: Theme.of(context).textTheme.labelLarge,
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
                      style: Theme.of(context).textTheme.titleMedium,
                      
                      )
                  ],
                ),
              ],
            )
        );
        },
      ),
    );
  }
}
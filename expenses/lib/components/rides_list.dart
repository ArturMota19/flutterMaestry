import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../models/rides.dart';

class RidesList extends StatelessWidget {
  const RidesList(this.rides, this.onDelete, {super.key});

  final List<Rides> rides;
  final void Function(String) onDelete;
  
  double totalAmount(Rides ride) {
  double total = 0.0;
  for (var value in ride.passengers.values) {
    total += value;
  }
  return total;
}

  @override
  Widget build(BuildContext context) {
    return rides.isEmpty ? Column(
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
          elevation: 5.0,
          margin: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 5.0,
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundColor: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Text(
                    'R\$${totalAmount(ride).toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ),
            title: Text(
              ride.passengers.keys.toString().replaceAll('(', '').replaceAll(')', ''),
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.black,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy').format(ride.date),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
              onPressed: () => onDelete(ride.id),
            )
          ),
        );
      },
    );
  }
}
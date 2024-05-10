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
    return rides.isEmpty ? 
    LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            height: constraints.maxHeight * 0.12,
            child: Text(
              'No rides added yet!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: constraints.maxHeight * 0.6,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
      }
    ) 
    :
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
            trailing: MediaQuery.of(context).size.width > 300 ? 
            TextButton.icon(
              icon: const Icon(Icons.delete),
              label: const Text("Delete"),
              onPressed: () => onDelete(ride.id),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.error),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
              ),
            )) :
            IconButton(
              icon: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
              onPressed: () => onDelete(ride.id),
            ),
          ),
        );
      },
    );
  }
}
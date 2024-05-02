import 'package:flutter/material.dart';

class RidesForm extends StatelessWidget {
  
  RidesForm(this.onSubmit, {super.key});

  final passangerController0 = TextEditingController();
  final amountController0 = TextEditingController();
  final passangerController1 = TextEditingController();
  final amountController1 = TextEditingController();
  final passangerController2 = TextEditingController();
  final amountController2 = TextEditingController();
  final passangerController3 = TextEditingController();
  final amountController3 = TextEditingController();

  final void Function(Map<String, double>) onSubmit;
  

  @override
  Widget build(BuildContext context) {
    return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: passangerController0,
                    decoration: InputDecoration(
                      labelText: 'Passanger',
                      ),
                  ),
                  TextField(
                    controller: amountController0,
                    decoration: InputDecoration(
                      labelText: 'Amount (R\$)',
                      ),
                  ),
                  TextField(
                    controller: passangerController1,
                    decoration: InputDecoration(
                      labelText: 'Passanger',
                      ),
                  ),
                  TextField(
                    controller: amountController1,
                    decoration: InputDecoration(
                      labelText: 'Amount (R\$)',
                      ),
                  ),
                  TextField(
                    controller: passangerController2,
                    decoration: InputDecoration(
                      labelText: 'Passanger',
                      ),
                  ),
                  TextField(
                    controller: amountController2,
                    decoration: InputDecoration(
                      labelText: 'Amount (R\$)',
                      ),
                  ),
                  TextField(
                    controller: passangerController3,
                    decoration: InputDecoration(
                      labelText: 'Passanger',
                      ),
                  ),
                  TextField(
                    controller: amountController3,
                    decoration: InputDecoration(
                      labelText: 'Amount (R\$)',
                      ),
                  ),
                  TextButton(
                    onPressed: () {
                      final passangers = {
                        passangerController0.text: double.parse(amountController0.text),
                        passangerController1.text: double.parse(amountController1.text),
                        passangerController2.text: double.parse(amountController2.text),
                        passangerController3.text: double.parse(amountController3.text),
                      };
                      onSubmit(passangers);
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.purple),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text('Add Ride'),
                  )
                ],
              ),
            ),
          );
  }
}
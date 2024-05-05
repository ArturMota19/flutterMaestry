import 'package:flutter/material.dart';

class RidesForm extends StatefulWidget {
  
  RidesForm(this.onSubmit, {super.key});

  final void Function(Map<String, double>) onSubmit;

  @override
  State<RidesForm> createState() => _RidesFormState();
}

class _RidesFormState extends State<RidesForm> {
  final passangerController0 = TextEditingController();

  final amountController0 = TextEditingController();

  final passangerController1 = TextEditingController();

  final amountController1 = TextEditingController();

  final passangerController2 = TextEditingController();

  final amountController2 = TextEditingController();

  final passangerController3 = TextEditingController();

  final amountController3 = TextEditingController();

  _submitForm() {
    final passengers = {
      if(passangerController0.text.isNotEmpty) passangerController0.text: double.tryParse(amountController0.text) ?? 0.0,
      if(passangerController1.text.isNotEmpty) passangerController1.text: double.tryParse(amountController1.text) ?? 0.0,
      if(passangerController2.text.isNotEmpty) passangerController2.text: double.tryParse(amountController2.text) ?? 0.0,
      if(passangerController3.text.isNotEmpty) passangerController3.text: double.tryParse(amountController3.text) ?? 0.0,
    };
    if(passangerController0.text.isEmpty || amountController0.text.isEmpty) {
      return;
    }
    widget.onSubmit(passengers);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
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
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_) {
                        _submitForm();
                      },
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
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_) {
                        _submitForm();
                      },
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
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_) {
                        _submitForm();
                      },
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
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_) {
                        _submitForm();
                      },
                      decoration: InputDecoration(
                        labelText: 'Amount (R\$)',
                        ),
                    ),
                    TextButton(
                      onPressed: () {
                        _submitForm();
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
            ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RidesForm extends StatefulWidget {

  
  RidesForm(this.onSubmit, {super.key});

  final void Function(Map<String, double>, DateTime) onSubmit;

  @override
  State<RidesForm> createState() => _RidesFormState();
}

class _RidesFormState extends State<RidesForm> {
  final _passangerController0 = TextEditingController();

  final _amountController0 = TextEditingController();

  final _passangerController1 = TextEditingController();

  final _amountController1 = TextEditingController();

  final _passangerController2 = TextEditingController();

  final _amountController2 = TextEditingController();

  final _passangerController3 = TextEditingController();

  final _amountController3 = TextEditingController();

  var _selectedDate = DateTime.now();

  _submitForm() {
    final passengers = {
      if(_passangerController0.text.isNotEmpty) _passangerController0.text: double.tryParse(_amountController0.text) ?? 0.0,
      if(_passangerController1.text.isNotEmpty) _passangerController1.text: double.tryParse(_amountController1.text) ?? 0.0,
      if(_passangerController2.text.isNotEmpty) _passangerController2.text: double.tryParse(_amountController2.text) ?? 0.0,
      if(_passangerController3.text.isNotEmpty) _passangerController3.text: double.tryParse(_amountController3.text) ?? 0.0,
    };
    if(_passangerController0.text.isEmpty || _amountController0.text.isEmpty ) {
      return;
    }
    widget.onSubmit(passengers, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime.now().subtract(const Duration(days: 7)),
      lastDate: DateTime.now().add(const Duration(days: 7)),
      ).then((pickedDate) => {
        if(pickedDate != null) {
          setState(() {
            _selectedDate = pickedDate;
          })
        }
        
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: SingleChildScrollView(
        child: Card(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0 + MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _passangerController0,
                        decoration: const InputDecoration(
                          labelText: 'Passanger',
                          ),
                      ),
                      TextField(
                        controller: _amountController0,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onSubmitted: (_) {
                          _submitForm();
                        },
                        decoration: const InputDecoration(
                          labelText: 'Amount (R\$)',
                          ),
                      ),
                      TextField(
                        controller: _passangerController1,
                        decoration: const InputDecoration(
                          labelText: 'Passanger',
                          ),
                      ),
                      TextField(
                        controller: _amountController1,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onSubmitted: (_) {
                          _submitForm();
                        },
                        decoration: const InputDecoration(
                          labelText: 'Amount (R\$)',
                          ),
                      ),
                      TextField(
                        controller: _passangerController2,
                        decoration: const InputDecoration(
                          labelText: 'Passanger',
                          ),
                      ),
                      TextField(
                        controller: _amountController2,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onSubmitted: (_) {
                          _submitForm();
                        },
                        decoration: const InputDecoration(
                          labelText: 'Amount (R\$)',
                          ),
                      ),
                      TextField(
                        controller: _passangerController3,
                        decoration: const InputDecoration(
                          labelText: 'Passanger',
                          ),
                      ),
                      TextField(
                        controller: _amountController3,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onSubmitted: (_) {
                          _submitForm();
                        },
                        decoration: const InputDecoration(
                          labelText: 'Amount (R\$)',
                          ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  _selectedDate == null ? 
                                  'No Date Selected' 
                                  :
                                  'Selected Date: ${DateFormat('dd/MM').format(_selectedDate)}'
                                ),
                                TextButton(
                                  onPressed: _showDatePicker,
                                  child: const Text('Choose Date'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(Colors.purple),
                                  ),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                    onPressed: () {
                                      _submitForm();
                                    },
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all(Colors.purple),
                                      backgroundColor: MaterialStateProperty.all(Colors.white),
                                    ),
                                    child: const Text('Add Ride'),
                                )
                              ],
                            ),
                          ),  
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
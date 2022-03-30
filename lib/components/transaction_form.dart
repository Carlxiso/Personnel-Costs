// This component will be the card form

import 'package:flutter/material.dart';
import 'adaptative_datepicker.dart';
import 'adaptative_btn.dart';
import 'adaptative_textfield.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;
  //Constructor
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  // const ({ Key? key }) : super(key: key);
  final _titleController = TextEditingController();

  final _valueControler = TextEditingController();

  // var _selectedDate;

  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueControler.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              AdaptiveTextField(
                /* - Option One - */
                /* - onChanged: (newValue) => title = newValue, - */
                /* - Option Two - */
                label: 'Title',
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptiveTextField(
                /* - Option One - */
                /* - onChanged: (newValue) => value = newValue, - */
                /* - Option Two - */
                label: 'Valor(€)',
                controller: _valueControler,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptiveDatePicker(
                selectedDate: _selectedDate,
                onDatechaged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeBtn(
                    label: 'New Transaction',
                    onPressed: _submitForm,
                  ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.pinkAccent,
                  //     onPrimary: Colors.white,
                  //   ),
                  //   onPressed: _submitForm,
                  //   child: const Text('New Transaction'),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

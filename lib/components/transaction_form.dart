// This component will be the card form

import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  /* - Option Two - */
  final titleController = TextEditingController();
  final valueControler = TextEditingController();

  //The function that will communivcate with widget parent "transaction_user"
  final void Function(String, double) onSubmit;
  //Constructor
  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueControler.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              /* - Option One - */
              /* - onChanged: (newValue) => title = newValue, - */
              /* - Option Two - */
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              /* - Option One - */
              /* - onChanged: (newValue) => value = newValue, - */
              /* - Option Two - */
              controller: valueControler,
              //Shows the keyboard
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Valor(€)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent,
                    onPrimary: Colors.white,
                  ),
                  onPressed: _submitForm,
                  child: Text('New Transaction'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

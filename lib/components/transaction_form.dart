// This component will be the card form

import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  /* - Option Two - */
  final titleController = TextEditingController();
  final valueControler = TextEditingController();

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
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              /* - Option One - */
              /* - onChanged: (newValue) => value = newValue, - */
              /* - Option Two - */
              controller: valueControler,
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
                  onPressed: () {
                    /* - Option One - */
                    /* - print(title); - */
                    /* - print(value); - */

                    /* - Option Two - */
                    print(titleController.text);
                    print(valueControler.text);
                  },
                  child: Text('New Transaction'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

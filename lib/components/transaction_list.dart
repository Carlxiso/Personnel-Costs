// This component will receive as parameter the list

import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  //Atribut
  final List<Transaction> transactions;

  // ignore: use_key_in_widget_constructors
  const TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      /*The ListView Widget will do the same thing we did with 
      the SingleChildScrollView widget

      just like the SingleChildScrollView this component needs to have 
      a parent component with a pre-defined size
      */

      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'No registered transactions.',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 100,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              /*
        With the ListView.builder you can control the number of items 
        displayed. This means that the number of rendering is controlled 
        or it makes the application faster 
        */
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        )),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '€ ${tr.value.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tr.title,
                            style: Theme.of(context).textTheme.titleSmall,
                            // style: const TextStyle(
                            //   fontWeight: FontWeight.bold,
                            //   fontSize: 16,
                            //   color: Colors.black,
                          ),
                          Text(
                            DateFormat('d MMM y').format(tr.date),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              /* A função map vai receber uma outro função, 
              que por sua vez essa mesma função vai receber 
              cada um dos elementos*/
              /* A ideia é converter um objecto do tipo transaction 
              para um componente visual Que neste cado será o Card Widget*/
              // children: transactions.map((tr) {}).toList(),
            ),
    );
  }
}

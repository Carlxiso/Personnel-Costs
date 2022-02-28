import 'package:costs/models/transactions.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  // const ExpensesApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // const MyHomePage({ Key? key }) : super(key: key);

  //List
  final _transactions = [
    // Elements type Transaction
    Transaction(
      id: 'T1',
      title: 'New Sneakers',
      value: 310.75,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T2',
      title: 'Electricity bill ',
      value: 200.13,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personnel Costs'),
      ),
      // Component Type Column
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        //Column receive a set of elements (Example: children  element)
        children: <Widget>[
          //Two components type Card
          Container(
            width: double.infinity,
            child: const Card(
              child: Text('Chart'),
              elevation: 2,
            ),
          ),
          const Card(
            child: Text('List of Transactions'),
            elevation: 2,
          ),
        ],
      ),
    );
  }
}

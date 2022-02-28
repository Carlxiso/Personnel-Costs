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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personnel Costs'),
      ),
      // Component Type Column
      body: Column(
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
          Container(
            width: double.infinity,
            child: const Card(
              child: Text('Another Card'),
              elevation: 2,
            ),
          ),
        ],
      ),
    );
  }
}

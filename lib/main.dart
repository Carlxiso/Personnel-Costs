import 'package:flutter/material.dart';
import '/components/transaction_user.dart';

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
  // const MyHomePage({Key? key}) : super(key: key);

  /* - Option One - */
  /* - late String title; - */
  /* - late String value; - */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personnel Costs'),
        actions: <Widget>[
          // Opens the model so that we can insert transactions
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      //It solves the bar warning scroll problem
      body: SingleChildScrollView(
        // Component Type Column
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            TransactionUser(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

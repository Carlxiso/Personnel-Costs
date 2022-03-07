import 'package:costs/components/transaction_form.dart';
import 'package:flutter/material.dart';
// import '/components/transaction_user.dart';
import 'dart:math';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transactions.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // const MyHomePage({Key? key}) : super(key: key);

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
      title: 'Electricity de Luz ',
      value: 200.1,
      date: DateTime.now(),
    )
  ];

//Function to add Transaction
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  _openTransactionsFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
          // return TransactionForm(onSubmit);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personnel Costs'),
        actions: <Widget>[
          // Opens the model so that we can insert transactions
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openTransactionsFormModal(context),
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
            // TransactionUser(),
            Column(
              children: <Widget>[
                TransactionForm(_addTransaction),
                TransactionList(_transactions),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionsFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

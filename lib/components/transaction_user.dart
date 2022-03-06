import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transactions.dart';

class TransactionUser extends StatefulWidget {
  // const TransactionUser({Key? key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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
    ),
    Transaction(
      id: 'T3',
      title: 'Conta #01 ',
      value: 200.1,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T4',
      title: 'Conta #02 ',
      value: 200.1,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T5',
      title: 'Conta #03 ',
      value: 200.1,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T6',
      title: 'Conta #04 ',
      value: 200.1,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T7',
      title: 'Conta #05 ',
      value: 200.1,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T8',
      title: 'Conta #06 ',
      value: 200.1,
      date: DateTime.now(),
    ),
  ];

//Function
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}

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
      /*The SingleChildScrollView is wrapped with a container so we can 
      have the list into a spave of 400px*/
      child: SingleChildScrollView(
        child: Column(
          /* A função map vai receber uma outro função, 
                que por sua vez essa mesma função vai receber 
                cada um dos elementos*/
          /* A ideia é converter um objecto do tipo transaction 
                para um componente visual*/
          children: transactions.map((tr) {
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
                      color: Colors.purple,
                      width: 2,
                    )),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '€ ${tr.value.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tr.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
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
          }).toList(),
        ),
      ),
    );
  }
}

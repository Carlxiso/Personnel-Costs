// This component will receive as parameter the list

// import 'dart:html';

import 'package:flutter/material.dart';
import '../models/transactions.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  //Atribut
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  // ignore: use_key_in_widget_constructors
  const TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.11,
                    child: Text(
                      'No registered transactions.',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          })
        : ListView.builder(
            /// With the ListView.builder you can control the number of items
            /// displayed. This means that the number of rendering is controlled
            /// or it makes the application faster
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(tr: tr, onRemove: onRemove);
            },
          );
  }
}

// This component will receive as parameter the list

import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

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
            /*
      With the ListView.builder you can control the number of items 
      displayed. This means that the number of rendering is controlled 
      or it makes the application faster 
      */
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  //leading é a parte inicial do 'tijolo'
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text(
                        '€${tr.value}',
                      )),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    DateFormat('d MM y').format(tr.date),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => onRemove(tr.id),
                  ),
                ),
              );
            },
          );
  }
}

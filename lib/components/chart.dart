import 'package:costs/models/transactions.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
import '../models/transactions.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  // const Chart({Key? key}) : super(key: key);

  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  /* Função do tipo Getter que vai retornar um List e dentro desse List 
  é retornado um Map que tem como chave uma String e o valor vai ser um Object
  */
  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;
      //Traditional version
      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransactions[i].value;
        }
      }

      // print(DateFormat.E().format(weekDay)[0]);
      // print(totalSum);

      return {
        'day': // O construtor E() vai dar a sigla do dia da semana
            DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  // Getter que vai calcular o total gasto na semana

  double get _weekTotalValue {
    //Método Fold()
    /*
    Funciona como o método Reduce(). Ele tem uma função que têm um acumulador
    e o elemento actual sendo o objectivo fazer uma operação sempre retornando
    o elemento que será usado como acumulador da primeira opeeração. 
     */
    return groupedTransactions.fold(0.0, (acc, tr) {
      return acc + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    // groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions.map((tr) {
          return ChartBar(
            label: tr['day'].toString(),
            value: double.parse(tr['value'].toString()),
            percentage: (tr['value'] as double) / _weekTotalValue,
          );
        }).toList(),
      ),
    );
  }
}

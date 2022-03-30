import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptiveDatePicker extends StatelessWidget {
  // const AdaptiveDatePicker({Key? key}) : super(key: key);

  final DateTime selectedDate;
  final Function(DateTime) onDatechaged;

  AdaptiveDatePicker({
    required this.selectedDate,
    required this.onDatechaged,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      // return;
      // print('Executado dentro do then');
      if (pickedDate == null) {
        return;
      }
      onDatechaged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2021),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDatechaged,
            ),
          )
        : Container(
            height: 100,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'No selected date.'
                        : 'Date Selected: ${DateFormat('dd/MM/y').format(
                            selectedDate,
                          )}',
                  ),
                ),
                TextButton(
                  child: const Text(
                    'Select Date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => _showDatePicker(context),
                ),
              ],
            ),
          );
  }
}

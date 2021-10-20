import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTx;
  Chart(this.recentTx);

  List<Map<String, Object>> get groupedTransactionValus {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalsum = 0;
      for (var i = 0; i < recentTx.length; i++) {
        if (recentTx[i].timeStamp.day == weekDay.day &&
            recentTx[i].timeStamp.month == weekDay.month &&
            recentTx[i].timeStamp.year == weekDay.year) {
          totalsum += recentTx[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalsum);
      return {
        'day': DateFormat.E().format(weekDay),
        'Amount': totalsum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValus);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}

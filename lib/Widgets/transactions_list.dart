import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './tx_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;
  TransactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SizedBox(
          height: 600,
          child: transaction.isEmpty
              ? LayoutBuilder(builder: (ctx, constraint) {
                  return Column(
                    children: <Widget>[
                      Text(
                        "No Transactions Added yet",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: constraint.maxHeight * .60,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  );
                })
              : ListView.builder(
                  itemBuilder: (ctx, index) {
                    return TransactionItem(
                        transaction: transaction[index], deleteTx: deleteTx);
                  },
                  itemCount: transaction.length,
                ));
    });
  }
}

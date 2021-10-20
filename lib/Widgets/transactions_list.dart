import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 600,
        child: transaction.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    "No Transactions Added yet",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Row(children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          transaction[index].amount.toStringAsFixed(2),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transaction[index].title,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(transaction[index].timeStamp),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      )
                    ]),
                  );
                },
                itemCount: transaction.length,
              ));
  }
}

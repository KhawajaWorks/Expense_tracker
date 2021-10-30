import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text('\$${widget.transaction.amount}')),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(widget.transaction.timeStamp)),
        trailing: MediaQuery.of(context).size.width > 580
            ? TextButton.icon(
                onPressed: () {
                  widget.deleteTx(widget.transaction.id);
                },
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).errorColor)),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () {
                  widget.deleteTx(widget.transaction.id);
                },
              ),
      ),
    );
  }
}

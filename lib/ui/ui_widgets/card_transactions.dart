import 'package:bank_app/model/transaction.dart';
import 'package:flutter/material.dart';

class CardTransactions extends StatelessWidget {
  const CardTransactions({
    Key key,
    @required this.transactions,
  }) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(transactions[index].transactionName),
                  subtitle: Text(transactions[index].dateTime.toString()),
                  trailing: Text(transactions[index].sum.toString()),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: transactions.length));
  }
}

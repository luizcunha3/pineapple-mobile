import 'package:flutter/material.dart';
import 'package:pineapple_flutter/components/expense_list_item.dart';
import 'package:pineapple_flutter/models/transaction.dart';

class ExpenseList extends StatelessWidget {
  final List<PineapleTransaction> transactions;

  final items = List<PineapleTransaction>.generate(2, (i) {
    return new PineapleTransaction(
        title: "Teste ${i}",
        value: -100.0 * (i == 0 ? -1 : 1),
        date: DateTime.now(),
        category: "Compras");
  });

  ExpenseList({@required this.transactions});

  ExpenseListItem _buildTransactionListTile(PineapleTransaction transaction) {
    return new ExpenseListItem(transaction: transaction);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return _buildTransactionListTile(transactions[index]);
      },
    );
  }
}

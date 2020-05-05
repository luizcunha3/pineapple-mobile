import 'package:flutter/material.dart';
import 'package:pineapple_flutter/models/transaction.dart';

class ExpenseListItem extends StatelessWidget {
  final PineapleTransaction transaction;

  ExpenseListItem({@required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  child: FlutterLogo(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  transaction.category ?? 'Sem Categoria',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  transaction.title,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  transaction.value.toStringAsFixed(2),
                  style: TextStyle(
                      fontSize: 15,
                      color: transaction.value > 1 ? Colors.green : Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

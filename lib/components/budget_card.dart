import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BudgetCard extends StatelessWidget {
  final String name;
  final double limit;
  final double currentSpent;

  double get usedPercentage {
    return (currentSpent / limit);
  }

  String get moneyLeft {
    return 'R\$ ${(limit - currentSpent).toStringAsFixed(2)}';
  }

  String get usedPercentageString {
    return '${(usedPercentage * 100).round().toString()}%';
  }

  BudgetCard({
    this.name,
    this.limit,
    this.currentSpent,
  });

  @override
  Widget build(BuildContext context) {
    var budgetCardHeader = Padding(
      padding: const EdgeInsets.only(left: 18, right: 8, top: 15),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 25,
              child: Icon(Icons.attachment),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
              ),
              Text(
                'R\$ ${limit.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );

    var budgetCardProgressionBar = Padding(
      padding: EdgeInsets.only(bottom: 18, left: 18, right: 18),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(usedPercentageString),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 20,
              child: LinearProgressIndicator(
                value: usedPercentage,
              ),
            ),
          )
        ],
      ),
    );

    var budgetCardRemainder = Padding(
      padding: EdgeInsets.only(left: 18, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Você ainda pode gastar'),
              Text(
                moneyLeft,
                style: TextStyle(fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );

    return Container(
      padding: EdgeInsets.all(25),
      child: Card(
        // color: Colors.grey[300],
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            budgetCardHeader,
            budgetCardProgressionBar,
            budgetCardRemainder,
          ],
        ),
      ),
    );
  }
}

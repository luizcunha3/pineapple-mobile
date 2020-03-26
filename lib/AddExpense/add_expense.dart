import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './category_selector.dart';

class AddExpense extends StatelessWidget {
  final iconColor = Colors.teal;
  void _teste(a) {
    print(a);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Expense",
            style: TextStyle(color: iconColor),
          ),
          iconTheme: IconThemeData(color: iconColor),
          bottom: TabBar(
            onTap: _teste,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.account_balance, color: iconColor)),
              Tab(icon: Icon(Icons.label, color: iconColor)),
              Tab(icon: Icon(Icons.attach_money, color: iconColor)),
              Tab(icon: Icon(Icons.category, color: iconColor)),
              Tab(icon: Icon(Icons.calendar_today, color: iconColor)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            TypeSelector(),
            Icon(Icons.label),
            Icon(Icons.attach_money),
            Icon(Icons.category),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}

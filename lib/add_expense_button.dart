import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'AddExpense/add_expense.dart';

class AddExpenseButton extends StatelessWidget {

  AddExpenseButton({@required this.onPressed});

  final GestureTapCallback onPressed;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RawMaterialButton(
      fillColor: Colors.yellow,
      splashColor: Colors.yellowAccent,
      onPressed: onPressed,
      shape: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 20.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.explore,
              color: Colors.teal
            ),
            SizedBox(width: 8.0),
            Text(
              "Expense",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),

    );
  }
}

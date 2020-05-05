import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pineapple_flutter/models/transaction.dart';
import '../controllers/transaction_controller.dart';

class ExpenseInput extends StatefulWidget {
  @override
  _ExpenseInputState createState() => _ExpenseInputState();
}

class _ExpenseInputState extends State<ExpenseInput> {
  var _isExpense = true;
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final expenseColor = Colors.red[200];
  final incomeColor = Colors.green[300];
  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  _saveExpense() async {
    final title = _titleController.text;
    final value =
        (double.tryParse(_valueController.text) ?? 0.0) * (_isExpense ? -1 : 1);

    var transaction = PineapleTransaction(
      date: _selectedDate,
      title: title,
      value: value,
    );
    TransactionController.saveTransaction(transaction);
    Navigator.of(context).pop();
  }

  Widget _makeSelector() {
    return Container(
      decoration: BoxDecoration(
        color: _isExpense ? expenseColor : incomeColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlatButton(
                color: Colors.grey[600].withOpacity(_isExpense ? 0.9 : 0.2),
                child: Text(
                  'Expense',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () => setState(() => _isExpense = true),
              ),
              FlatButton(
                color: Colors.grey[600].withOpacity(_isExpense ? 0.2 : 0.9),
                child: Text(
                  'Income',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () => setState(() => _isExpense = false),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.76,
                child: TextField(
                  controller: _valueController,
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: new TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: 'Value',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.check_box),
                color: Colors.white,
                onPressed: () {
                  _saveExpense();
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      builder: (context) {
        return Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(25),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      hintText: 'Title',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          'Expense date: ${DateFormat('d/M/y').format(_selectedDate)}'),
                      FlatButton(
                        child: Text('Select Date'),
                        onPressed: _showDatePicker,
                      )
                    ],
                  ),
                ],
              ),
            ),
            _makeSelector(),
          ],
        );
      },
      onClosing: () {
        print('fechou');
      },
    );
  }
}

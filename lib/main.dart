import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pineapple_flutter/components/budget_card.dart';
import 'package:pineapple_flutter/components/expense_list.dart';
import 'package:pineapple_flutter/components/input_form.dart';
import 'package:pineapple_flutter/controllers/transaction_controller.dart';
import 'package:pineapple_flutter/models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestApp(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
    );
  }
}

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  List<PineapleTransaction> transactions = null;

  Widget widgetBeingTested() {
    if (transactions == null) {
      return Center(child: Text('Carregando'));
    } else {
      return ExpenseList(
        transactions: transactions,
      );
    }
  }

  _getTransactions() {
    TransactionController.getTransactions().then((value) => {
          setState(() {
            transactions = value;
          })
        });
  }

  _openExpenseInput(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SingleChildScrollView(
              child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ExpenseInput(),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    _getTransactions();
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste'),
      ),
      body: Container(
        child: widgetBeingTested(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _openExpenseInput(context);
        },
      ),
    );
  }
}

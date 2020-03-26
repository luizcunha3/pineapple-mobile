import 'package:flutter/material.dart';
import 'add_expense_button.dart';
import 'budget_card.dart';
import 'AddExpense/add_expense.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        accentColor: Colors.teal
      ),
      home: MyHomePage(title: 'Pineapple'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _addNewExpense() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddExpense()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: TextStyle(color: Colors.teal),),
      ),
      body: GridView.count(

        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return BudgetCard();
        }),
      ),
      floatingActionButton: AddExpenseButton(
        onPressed: _addNewExpense,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

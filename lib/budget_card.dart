import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BudgetCard extends StatelessWidget {
  void _clicaBotaoGenerico() {
    print("Teste");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.teal.withAlpha(30),
        onTap: _clicaBotaoGenerico,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 80,
                  ),
                  SizedBox(width: 20),
                  Text("Compras",
                      style: DefaultTextStyle.of(context)
                          .style
                          .apply(fontSizeFactor: 2.0))
                ],
              ),
              Row(
                children: <Widget>[
                  CircularProgressIndicator(value: 0.24)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

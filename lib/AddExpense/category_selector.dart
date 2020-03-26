import 'package:flutter/material.dart';

class TypeSelector extends StatelessWidget {
  final assetImage = AssetImage('assets/carinha.png');
  void _tapOnButton() {
    print("teste");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 128),
            child: Image(
              image: assetImage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              "Is it an income or an expense?",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RawMaterialButton(
                  shape: const CircleBorder(),
                  padding: EdgeInsets.all(18),
                  fillColor: Colors.teal,
                  splashColor: Colors.tealAccent,
                  child: Icon(Icons.account_balance_wallet),
                  onPressed: _tapOnButton,
                ),
                SizedBox(width: 64,),
                RawMaterialButton(
                  shape: const CircleBorder(),
                  padding: EdgeInsets.all(18),
                  fillColor: Colors.deepOrange,
                  splashColor: Colors.orangeAccent,
                  child: Icon(Icons.payment),
                  onPressed: _tapOnButton,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pineapple_flutter/models/transaction.dart';

class TransactionController {
  static Future<List<PineapleTransaction>> getTransactions() async {
    final databaseReference = Firestore.instance;
    return databaseReference
        .collection("transactions")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      return snapshot.documents.map((f) {
        return _convertToTransaction(f.data);
      }).toList();
    });
  }

  static PineapleTransaction _convertToTransaction(Map<String, dynamic> data) {
    return new PineapleTransaction(
      title: data['title'],
      value: data['value'],
      date: null,
    );
  }

  static saveTransaction(PineapleTransaction transaction) async {
    final databaseReference = Firestore.instance;
    DocumentReference ref =
        await databaseReference.collection("transactions").add({
      'title': transaction.title,
      'value': transaction.value,
      'date': transaction.date,
    });
    print(ref.documentID);
  }
}

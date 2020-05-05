import 'package:flutter/foundation.dart';

class PineapleTransaction {
  final String title;
  final double value;
  final DateTime date;
  final String category;
  final int budget;

  PineapleTransaction({
    @required this.title,
    @required this.value,
    @required this.date,
    this.budget,
    this.category,
  });
}

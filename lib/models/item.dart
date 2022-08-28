import 'package:flutter/material.dart';

class Item {
  String id = '';
  int days = 0;
  String title = '';
  DateTime startDate = DateTime.now();
  DateTime get endDate => startDate.add(Duration(days: days - 1));
  List<Color> colors = [const Color(0xFFE7E6E6), const Color(0xFFE7E6E6)];
  List<int> contents = [];
  String isDone = '';
  Item({
    required this.id,
    required this.days,
    required this.title,
    required this.startDate,
    // required this.endDate,
    required this.colors,
    required this.contents,
    required this.isDone,
  });
}

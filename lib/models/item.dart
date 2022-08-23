import 'package:flutter/material.dart';

class Item {
  int days = 0;
  String title = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<Color> colors = [const Color(0xFFE7E6E6), const Color(0xFFE7E6E6)];
  String isDone = '';
  Item({
    required this.days,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.colors,
    required this.isDone,
  });
}

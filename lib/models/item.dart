import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Item {
  String id = '';
  int days = 0;
  String title = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  int colors = 0;
  List contents = [];
  String isDone = '';
  String uid = '';

  Item({
    required this.id,
    required this.days,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.colors,
    required this.contents,
    required this.isDone,
    required this.uid,
  });
}

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'item.dart';
import 'test.dart';

final firestore = FirebaseFirestore.instance.collection('item');

void createItem(id, days, title, colors, startDate, contents, isDone) {
  Item item = Item(
    id: id,
    days: int.parse(days),
    title: title,
    startDate: startDate,
    endDate: startDate.add(Duration(days: int.parse(days) - 1)),
    colors: colors,
    contents: contents,
    isDone: isDone,
  );
  items[id] = item;

  firestore.doc(id).set({
    'title': title,
    'days': int.parse(days),
    'startDate': startDate,
    'colors': colors,
    'contents': contents,
    'isDone': isDone,
  });
}

void deleteItem(id) {
  firestore.doc(id).delete();
}

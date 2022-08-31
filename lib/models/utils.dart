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

Item getItem(e) {
  final v = e.data() as Map;

  final id = e.id;
  final colors = v['colors'];
  final days = v['days'];
  final title = v['title'];
  final startDate = DateTime.parse(v['startDate'].toDate().toString());
  final endDate = startDate.add(Duration(days: days - 1));
  final contents = v['contents'];
  final isDone = v['isDone'];

  Item item = Item(
    id: e.id,
    days: days,
    title: title,
    startDate: startDate,
    endDate: endDate,
    colors: colors,
    contents: contents,
    isDone: isDone,
  );

  items[id] = item;

  if (DateTime.now().difference(items[id]!.endDate).inDays > 0) {
    int cnt = 0;
    for (int i in items[id]!.contents) {
      if (i == 1 || i == 4) {
        cnt++;
      }
    }
    if (cnt / items[id]!.days * 100 >= 90) {
      items[id]!.isDone = '성공';
      firestore.doc(id).update({'isDone': '성공'});
    } else {
      items[id]!.isDone = '실패';
      firestore.doc(id).update({'isDone': '실패'});
    }
  }

  return item;
}

void updateItem(id, newTitle) {
  firestore.doc(id).update({'title': newTitle});
  items[id]!.title = newTitle;
}

void deleteItem(id) {
  firestore.doc(id).delete();
  items.remove(id);
}

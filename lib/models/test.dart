import 'package:ido/models/item.dart';
import '../constants.dart';

List<Item> items = [
  Item(
      days: 30,
      title: '매일 운동하기🔥',
      startDate: DateTime(2022, 08, 01),
      endDate: DateTime(2022, 08, 31),
      colors: colors[0],
      isDone: ''),
  Item(
      days: 80,
      title: '일주일에 책 한 권📖',
      startDate: DateTime(2022, 06, 01),
      endDate: DateTime(2022, 08, 20),
      colors: colors[1],
      isDone: '실패'),
  Item(
      days: 365,
      title: '스페인어 마스터💃🏻',
      startDate: DateTime(2022, 05, 01),
      endDate: DateTime(2023, 05, 01),
      colors: colors[2],
      isDone: ''),
  Item(
      days: 100,
      title: '1일 1커밋, 잔디심기🌱',
      startDate: DateTime(2022, 01, 01),
      endDate: DateTime(2022, 04, 11),
      colors: colors[3],
      isDone: '성공'),
  Item(
      days: 30,
      title: '매일 운동하기🔥',
      startDate: DateTime(2022, 01, 10),
      endDate: DateTime(2022, 02, 09),
      colors: colors[4],
      isDone: '실패'),
];

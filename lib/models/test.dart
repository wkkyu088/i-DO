import 'package:ido/models/item.dart';
import '../constants.dart';

Map<String, Item> items = {
  '0': Item(
    id: '0',
    days: 30,
    title: '매일 운동하기🔥',
    startDate: DateTime(2022, 08, 01),
    colors: colors[0],
    contents: [1, 1, 1, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 3] +
        List<int>.filled(30 - 14, 0),
    isDone: '',
  ),
  '1': Item(
    id: '1',
    days: 100,
    title: '1일 1커밋, 잔디심기🌱',
    startDate: DateTime(2022, 01, 01),
    colors: colors[3],
    contents: List<int>.filled(100 - 2, 2) + [1, 3],
    isDone: '실패',
  ),
  '2': Item(
    id: '2',
    days: 30,
    title: '매일 운동하기🔥',
    startDate: DateTime(2022, 01, 10),
    colors: colors[4],
    contents: List<int>.filled(30 - 1, 1) + [3],
    isDone: '성공',
  )
};
  // Item(
  //   days: 80,
  //   title: '일주일에 책 한 권📖',
  //   startDate: DateTime(2022, 06, 01),
  //   colors: colors[1],
  //   contents: List<int>.filled(80, 2),
  //   isDone: '실패',
  // ),
  // Item(
  //   days: 365,
  //   title: '스페인어 마스터💃🏻',
  //   startDate: DateTime(2022, 05, 01),
  //   colors: colors[2],
  //   contents: [3] + List<int>.filled(365 - 1, 0),
  //   isDone: '',
  // ),


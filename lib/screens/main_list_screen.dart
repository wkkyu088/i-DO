// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ido/models/item.dart';
import 'package:ido/screens/challenge_screen.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/drawer_tab.dart';
import '../widgets/floating_button.dart';
import '../widgets/challenge_card.dart';
import '../widgets/empty_phrase.dart';

import '../models/test.dart';
import '../constants.dart';
import '../models/utils.dart';

class MainListScreen extends StatefulWidget {
  const MainListScreen({Key? key}) : super(key: key);

  @override
  State<MainListScreen> createState() => _MainListScreenState();
}

class _MainListScreenState extends State<MainListScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showFab = true;
  Map<String, dynamic>? v = {};

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);

    items.clear();

    // createItem(
    //   DateTime.now().microsecondsSinceEpoch.toString(),
    //   30,
    //   '매일 운동하기🔥',
    //   0,
    //   DateTime(2022, 08, 31),
    //   [1, 1, 1, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 3] + List<int>.filled(30 - 14, 0),
    //   '',
    // );

    // createItem(
    //   DateTime.now().microsecondsSinceEpoch.toString(),
    //   10,
    //   '1일 1커밋, 잔디심기🌱',
    //   3,
    //   DateTime(2022, 08, 16),
    //   [1, 1, 1, 1, 1, 1, 1, 1, 2, 3],
    //   '성공',
    // );

    // createItem(
    //   DateTime.now().microsecondsSinceEpoch.toString(),
    //   15,
    //   '물 마시기💧',
    //   4,
    //   DateTime(2022, 08, 02),
    //   List<int>.filled(14, 2) + [3],
    //   '실패',
    // );

    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(kMainIcon, kMainTitle, scaffoldKey, context),
      drawer: const DrawerTab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AnimatedSlide(
        duration: duration,
        offset: _showFab ? Offset.zero : const Offset(0, 2),
        child: AnimatedOpacity(
          duration: duration,
          opacity: _showFab ? 1 : 0,
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: floatingButton(context, 'open'),
          ),
        ),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          setState(() {
            if (direction == ScrollDirection.reverse) {
              _showFab = false;
            } else if (direction == ScrollDirection.forward) {
              _showFab = true;
            }
          });
          return true;
        },
        child: RawScrollbar(
            child: FutureBuilder<QuerySnapshot>(
                future: firestore.orderBy('startDate', descending: true).get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: kPoint,
                      ),
                    );
                  }

                  return snapshot.data!.docs.isEmpty
                      ? totallyEmpty()
                      : ListView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          children: snapshot.data!.docs.map((e) {
                            final v = e.data() as Map;

                            final _id = e.id;
                            final _colors = v['colors'];
                            final _days = v['days'];
                            final _title = v['title'];
                            final _startDate = DateTime.parse(
                                v['startDate'].toDate().toString());
                            final _endDate =
                                _startDate.add(Duration(days: _days - 1));
                            final _contents = v['contents'];
                            final _isDone = v['isDone'];

                            Item _item = Item(
                              id: _id,
                              days: _days,
                              title: _title,
                              startDate: _startDate,
                              endDate: _endDate,
                              colors: _colors,
                              contents: _contents,
                              isDone: _isDone,
                            );

                            items[_id] = _item;

                            return challengeCard(context, _id, _colors, _days,
                                _title, _startDate, _endDate, _isDone, () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChallengeScreen(id: _id)))
                                  .then((value) {
                                setState(() {});
                              });
                            });
                          }).toList(),
                        );
                })),
      ),
    );
  }
}

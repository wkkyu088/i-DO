import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  @override
  void initState() {
    super.initState();
    setState(() {});
    // createItem(
    //   DateTime.now().microsecondsSinceEpoch.toString(),
    //   '30',
    //   '매일 운동하기🔥',
    //   0,
    //   DateTime(2022, 08, 31),
    //   [1, 1, 1, 2, 1, 1, 1, 2, 2, 1, 1, 2, 1, 3] + List<int>.filled(30 - 14, 0),
    //   '',
    // );
    // createItem(
    //   DateTime.now().microsecondsSinceEpoch.toString(),
    //   '50',
    //   '1일 1커밋, 잔디심기🌱',
    //   3,
    //   DateTime(2022, 03, 16),
    //   List<int>.filled(50, 1),
    //   '성공',
    // );
    // createItem(
    //   DateTime.now().microsecondsSinceEpoch.toString(),
    //   '100',
    //   '물 마시기💧',
    //   4,
    //   DateTime(2022, 05, 02),
    //   List<int>.filled(100, 2),
    //   '실패',
    // );
  }

  _future() async {
    var snapshot = await FirebaseFirestore.instance
        .collection('item')
        .where('uid', isEqualTo: uid)
        .get();

    for (var e in snapshot.docs) {
      getItem(e);
    }

    items = Map.fromEntries(
        items.entries.toList()..sort((e1, e2) => e2.key.compareTo(e1.key)));

    return items;
  }

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);

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
        child: RefreshIndicator(
          onRefresh: () {
            setState(() {});
            return Future<void>.value();
          },
          child: RawScrollbar(
              child: FutureBuilder(
                  future: _future(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: kPoint,
                        ),
                      );
                    }
                    return items.isEmpty
                        ? totallyEmpty()
                        : ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, i) {
                              String key = items.keys.elementAt(i);
                              return challengeCard(
                                  context,
                                  items[key]!.id,
                                  items[key]!.colors,
                                  items[key]!.days,
                                  items[key]!.title,
                                  items[key]!.startDate,
                                  items[key]!.endDate,
                                  items[key]!.isDone, () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChallengeScreen(
                                            id: items[key]!.id))).then((value) {
                                  setState(() {});
                                });
                              });
                            },
                          );
                  })),
        ),
      ),
    );
  }
}

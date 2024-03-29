import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ido/screens/challenge_screen.dart';

import '../models/item.dart';
import '../models/utils.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/drawer_tab.dart';
import '../widgets/floating_button.dart';
import '../widgets/challenge_card.dart';
import '../widgets/empty_phrase.dart';

import '../models/test.dart';
import '../constants.dart';

class PresentListScreen extends StatefulWidget {
  const PresentListScreen({Key? key}) : super(key: key);

  @override
  State<PresentListScreen> createState() => _PresentListScreenState();
}

class _PresentListScreenState extends State<PresentListScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showFab = true;
  bool isEmptyPresent = true;

  void setEmptyPresent() {
    items.forEach((key, value) {
      if (value.endDate.difference(DateTime.now()).inDays >= 0) {
        isEmptyPresent = false;
      }
    });
    items = Map.fromEntries(
        items.entries.toList()..sort((e1, e2) => e2.key.compareTo(e1.key)));
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);

    setEmptyPresent();

    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(kPresentIcon, kPresentTitle, scaffoldKey, context),
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
      body: items.isEmpty
          ? totallyEmpty()
          : isEmptyPresent
              ? partlyEmpty('진행 중인 챌린지가 없어요 😴')
              : NotificationListener<UserScrollNotification>(
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
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, i) {
                        String key = items.keys.elementAt(i);
                        if (items[key]!
                                .endDate
                                .difference(DateTime.now())
                                .inDays >=
                            0) {
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
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
    );
  }
}

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

class PreviousListScreen extends StatefulWidget {
  const PreviousListScreen({Key? key}) : super(key: key);

  @override
  State<PreviousListScreen> createState() => _PreviousListScreenState();
}

class _PreviousListScreenState extends State<PreviousListScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showFab = true;
  bool isEmptyPrevious = true;

  void setEmptyPrevious() {
    items.forEach((key, value) {
      if (DateTime.now().difference(value.endDate).inDays > 0) {
        isEmptyPrevious = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);

    setEmptyPrevious();

    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(kPreviousIcon, kPreviousTitle, scaffoldKey, context),
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
          : isEmptyPrevious
              ? partlyEmpty('아직 지난 챌린지가 없어요 👏🏻')
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
                        if (DateTime.now()
                                .difference(items[key]!.endDate)
                                .inDays >
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

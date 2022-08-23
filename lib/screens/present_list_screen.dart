import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    for (int i = 0; i < items.length; i++) {
      if (items[i].endDate.difference(DateTime.now()).inDays >= 0) {
        isEmptyPresent = false;
        break;
      }
    }
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
            margin: const EdgeInsets.only(bottom: 20),
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
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      if (items[i].endDate.difference(DateTime.now()).inDays >=
                          0) {
                        return challengeCard(
                            context,
                            i,
                            items[i].days,
                            items[i].title,
                            items[i].startDate,
                            items[i].endDate,
                            items[i].isDone);
                      }
                      return Container();
                    },
                  ),
                ),
    );
  }
}

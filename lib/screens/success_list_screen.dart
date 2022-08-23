import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/drawer_tab.dart';
import '../widgets/floating_button.dart';
import '../widgets/challenge_card.dart';
import '../widgets/empty_phrase.dart';

import '../models/test.dart';
import '../constants.dart';

class SuccessListScreen extends StatefulWidget {
  const SuccessListScreen({Key? key}) : super(key: key);

  @override
  State<SuccessListScreen> createState() => _SuccessListScreenState();
}

class _SuccessListScreenState extends State<SuccessListScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showFab = true;
  bool isEmptySuccess = true;

  void setEmptySuccess() {
    for (int i = 0; i < items.length; i++) {
      if (items[i].isDone == '성공') {
        isEmptySuccess = false;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);

    setEmptySuccess();

    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(kSuccessIcon, kSuccessTitle, scaffoldKey, context),
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
          : isEmptySuccess
              ? partlyEmpty('아직 성공한 챌린지가 없어요 🥲')
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
                      if (items[i].isDone == '성공') {
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

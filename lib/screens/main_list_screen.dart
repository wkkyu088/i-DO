import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/drawer_tab.dart';
import '../widgets/floating_button.dart';
import '../widgets/challenge_card.dart';
import '../widgets/empty_phrase.dart';

import '../models/test.dart';
import '../constants.dart';

class MainListScreen extends StatefulWidget {
  const MainListScreen({Key? key}) : super(key: key);

  @override
  State<MainListScreen> createState() => _MainListScreenState();
}

class _MainListScreenState extends State<MainListScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showFab = true;

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
      body: items.isEmpty
          ? totallyEmpty()
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
              child: RawScrollbar(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
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
                        items[key]!.isDone);
                  },
                ),
              ),
            ),
    );
  }
}

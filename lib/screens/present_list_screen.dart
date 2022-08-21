import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/drawer_tab.dart';
import '../constants.dart';

class PresentListScreen extends StatefulWidget {
  const PresentListScreen({Key? key}) : super(key: key);

  @override
  State<PresentListScreen> createState() => _PresentListScreenState();
}

class _PresentListScreenState extends State<PresentListScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(kPresentIcon, kPresentTitle, scaffoldKey, context),
      body: Container(),
      drawer: DrawerTab(),
    );
  }
}

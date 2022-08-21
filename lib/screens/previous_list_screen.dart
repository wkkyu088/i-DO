import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/drawer_tab.dart';
import '../constants.dart';

class PreviousListScreen extends StatefulWidget {
  const PreviousListScreen({Key? key}) : super(key: key);

  @override
  State<PreviousListScreen> createState() => _PreviousListScreenState();
}

class _PreviousListScreenState extends State<PreviousListScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(kPreviousIcon, kPreviousTitle, scaffoldKey, context),
      body: Container(),
      drawer: DrawerTab(),
    );
  }
}

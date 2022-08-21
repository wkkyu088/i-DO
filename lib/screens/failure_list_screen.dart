import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/drawer_tab.dart';
import '../constants.dart';

class FailureListScreen extends StatefulWidget {
  const FailureListScreen({Key? key}) : super(key: key);

  @override
  State<FailureListScreen> createState() => _FailureListScreenState();
}

class _FailureListScreenState extends State<FailureListScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(kFailureIcon, kFailureTitle, scaffoldKey, context),
      body: Container(),
      drawer: DrawerTab(),
    );
  }
}

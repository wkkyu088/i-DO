import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/drawer_tab.dart';
import '../constants.dart';

class SuccessListScreen extends StatefulWidget {
  const SuccessListScreen({Key? key}) : super(key: key);

  @override
  State<SuccessListScreen> createState() => _SuccessListScreenState();
}

class _SuccessListScreenState extends State<SuccessListScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(kSuccessIcon, kSuccessTitle, scaffoldKey, context),
      body: Container(),
      drawer: DrawerTab(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ido/screens/settings/account_setting.dart';
import 'package:ido/screens/settings/display_setting.dart';
import 'package:ido/screens/settings/notification_setting.dart';

import '../widgets/custom_appbar.dart';
import '../constants.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    Widget customTile(icon, title, page) {
      return ListTile(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        leading: Container(
            alignment: Alignment.centerLeft,
            width: 10,
            child: Icon(icon, color: kBlack, size: 20)),
        minLeadingWidth: 20,
        title: Text(title, style: TextStyle(fontSize: kMedium)),
        trailing: page != null
            ? Icon(Icons.chevron_right_rounded, color: kBlack, size: 26)
            : Text(
                '현재 : $userName',
                style: TextStyle(color: kGrey, fontSize: kMedium),
              ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar('', '설정', scaffoldKey, context),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height - 110,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              customTile(Icons.person_outline_rounded, '계정',
                  const AccountSettingScreen()),
              Container(color: kLightGrey, height: 0.6),
              customTile(Icons.visibility_outlined, '화면',
                  const DisplaySettingScreen()),
              Container(color: kLightGrey, height: 0.6),
              customTile(Icons.notifications_outlined, '알림',
                  const NotificationSettingScreen()),
              Container(color: kLightGrey, height: 0.6),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('i',
                            style: TextStyle(color: kPoint, fontSize: kXLarge)),
                        Text('DO', style: TextStyle(fontSize: kXLarge))
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

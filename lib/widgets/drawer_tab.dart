import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ido/screens/login_screen.dart';

import '../models/test.dart';
import '../screens/main_list_screen.dart';
import '../screens/previous_list_screen.dart';
import '../screens/present_list_screen.dart';
import '../screens/success_list_screen.dart';
import '../screens/failure_list_screen.dart';
import '../screens/setting_screen.dart';

import '../constants.dart';

class DrawerTab extends StatefulWidget {
  const DrawerTab({Key? key}) : super(key: key);

  @override
  State<DrawerTab> createState() => _DrawerTabState();
}

class _DrawerTabState extends State<DrawerTab> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    Widget customListTile(title, leading, page) {
      return ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: kMedium),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        horizontalTitleGap: 0,
        minLeadingWidth: 27,
        leading: Text(leading, style: TextStyle(fontSize: kSmall)),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
      );
    }

    Widget _divider() {
      return Container(
        height: 0.5,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: kLightGrey,
      );
    }

    return Drawer(
      width: width * 0.6,
      backgroundColor: kWhite,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingScreen()));
                    },
                    icon: Icon(
                      Icons.settings_rounded,
                      color: kBlack,
                      size: kIcon,
                    ),
                    padding: const EdgeInsets.all(5),
                    constraints: const BoxConstraints(),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      child: Text(
                        '${userName} 님',
                        style: TextStyle(fontSize: kBig + 2, color: kPoint),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '나도할수있다 😎',
                        style: TextStyle(fontSize: kXLarge, color: kBlack),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          customListTile(kMainTitle, '👀', const MainListScreen()),
          _divider(),
          customListTile(kPresentTitle, '⏳', const PresentListScreen()),
          _divider(),
          customListTile(kPreviousTitle, '⌛', const PreviousListScreen()),
          _divider(),
          customListTile(kSuccessTitle, '❗', const SuccessListScreen()),
          _divider(),
          customListTile(kFailureTitle, '❓', const FailureListScreen()),
          _divider(),
          TextButton(
            onPressed: () {
              print("로그아웃됨");
              FirebaseAuth.instance.signOut();
              userName = "";
              uid = "";
              items.clear();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: Text("로그아웃"),
          ),
        ],
      ),
    );
  }
}

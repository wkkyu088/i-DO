import 'package:flutter/material.dart';
import 'package:ido/widgets/custom_dialog.dart';

import '../widgets/custom_appbar.dart';
import '../constants.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String userValue = "";

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    Widget customTile(title, onTap) {
      return ListTile(
        onTap: onTap,
        leading: Container(
            alignment: Alignment.centerLeft,
            width: 10,
            child: Icon(Icons.circle, color: kBlack, size: 7)),
        minLeadingWidth: 10,
        title: Text(title, style: TextStyle(fontSize: kMedium)),
        trailing: onTap != null
            ? Icon(Icons.chevron_right_rounded, color: kBlack, size: 26)
            : Text(
                '현재 : $user',
                style: TextStyle(color: kGrey, fontSize: kMedium),
              ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar('', '설정', scaffoldKey, context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Stack(
          children: [
            ListView(
              children: [
                customTile('닉네임 변경', null),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: TextField(
                        maxLines: 1,
                        maxLength: 20,
                        onChanged: (v) {
                          userValue = v;
                        },
                        decoration: InputDecoration(
                          hintText: '변경할 닉네임을 입력하세요',
                          hintStyle: TextStyle(color: kGrey, fontSize: kSmall),
                          counterText: '',
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                        ),
                      )),
                      TextButton(
                        onPressed: () {
                          user = userValue;
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return customDialog(
                                  context, '변경', '닉네임을 변경하였습니다.', '확인', null);
                            },
                          );
                        },
                        style: TextButton.styleFrom(primary: kGrey),
                        child: Text(
                          '변경',
                          style: TextStyle(color: kPoint, fontSize: kSmall),
                        ),
                      )
                    ]),
                const SizedBox(height: 10),
                Container(color: kLightGrey, height: 0.6),
                customTile('챌린지 알림 설정', () {}),
                Container(color: kLightGrey, height: 0.6),
                customTile('공지사항', () {}),
                Container(color: kLightGrey, height: 0.6),
                customTile('도움말', () {}),
                Container(color: kLightGrey, height: 0.6),
                customTile('앱 정보', () {}),
                Container(color: kLightGrey, height: 0.6),
                customTile('문의사항', () {}),
                Container(color: kLightGrey, height: 0.6),
              ],
            ),
            Container(
              width: width,
              height: height,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(15),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('i', style: TextStyle(color: kPoint, fontSize: kXLarge)),
                Text('DO', style: TextStyle(fontSize: kXLarge))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

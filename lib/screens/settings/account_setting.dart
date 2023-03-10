import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_dialog.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({Key? key}) : super(key: key);

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var userEmail = "";

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final controller = TextEditingController();
    controller.text = userName;

    Widget customTile(title) {
      return Row(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: 10,
            child: Icon(Icons.circle, color: kBlack, size: 7),
          ),
          Text(title, style: TextStyle(fontSize: kMedium))
        ],
      );
    }

    Widget spacer() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        color: kLightGrey,
        height: 0.6,
      );
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar('', '계정 설정', scaffoldKey, context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customTile('연동된 이메일'),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(email,
                      style: TextStyle(fontSize: kSmall, color: kGrey)),
                )
              ],
            ),
            spacer(),
            customTile('닉네임 변경'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      maxLines: 1,
                      maxLength: 20,
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: '변경할 닉네임을 입력하세요',
                        hintStyle: TextStyle(color: kGrey, fontSize: kSmall),
                        counterText: '',
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: kBorderRadiusM,
                            borderSide: BorderSide(color: kGrey, width: 0.6)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: kBorderRadiusM,
                            borderSide: BorderSide(color: kBlack, width: 0.6)),
                        border: OutlineInputBorder(
                            borderRadius: kBorderRadiusM,
                            borderSide: BorderSide(color: kGrey, width: 0.6)),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      userName = controller.text;
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(uid)
                          .update({'userName': controller.text});
                      controller.text = userName;
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialog(
                            title: '변경',
                            content: '닉네임을 변경하였습니다.',
                            btn: '확인',
                          );
                        },
                      );
                    },
                    style: TextButton.styleFrom(primary: kGrey),
                    child: Text(
                      '변경',
                      style: TextStyle(color: kPoint, fontSize: kSmall),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/custom_dialog.dart';

import '../constants.dart';

AppBar customAppBar(String icon, String title, scaffoldKey, context) {
  return AppBar(
    toolbarHeight: 70,
    iconTheme: IconThemeData(color: kBlack),
    centerTitle: true,
    title: Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon == ""
              ? Container()
              : Container(
                  padding: const EdgeInsets.only(top: 1.5, right: 5),
                  child: Text(icon,
                      style: TextStyle(color: kBlack, fontSize: kLarge))),
          Text(title, style: TextStyle(color: kBlack, fontSize: kXLarge)),
        ],
      ),
    ),
    elevation: 0,
    backgroundColor: kWhite,
    leading: icon == "" || title == ''
        ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: kBlack,
              size: kIcon + 2,
            ))
        : IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(
              Icons.menu_rounded,
              color: kBlack,
              size: kIcon,
            )),
    actions: title == ''
        ? [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: kGrey,
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                '수정',
                style: TextStyle(color: kBlack, fontSize: kXSmall),
              ),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialog(
                        title: '잠시만요!',
                        content: '정말 삭제하시나요?',
                        btn: '삭제',
                      );
                    });
              },
              style: TextButton.styleFrom(
                primary: kGrey,
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                '삭제',
                style: TextStyle(color: kDelete, fontSize: kXSmall),
              ),
            ),
          ]
        : [
            Container(
              width: 85,
              color: Colors.transparent,
            )
          ],
  );
}

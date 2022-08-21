import 'package:flutter/material.dart';

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
          title == '설정'
              ? Container()
              : Container(
                  padding: const EdgeInsets.only(top: 1.5, right: 5),
                  child: Text(icon,
                      style: TextStyle(color: kBlack, fontSize: kAppBar - 5))),
          Text(title, style: TextStyle(color: kBlack, fontSize: kAppBar)),
        ],
      ),
    ),
    elevation: 0,
    backgroundColor: kWhite,
    leading: title == '설정'
        ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: kBlack,
              size: 28,
            ))
        : IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(
              Icons.menu_rounded,
              color: kBlack,
            )),
    actions: [
      Container(
        width: 85,
        color: Colors.transparent,
      )
    ],
  );
}

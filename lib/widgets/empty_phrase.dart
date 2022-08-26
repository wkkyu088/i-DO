import 'package:flutter/material.dart';

import '../constants.dart';

Widget totallyEmpty() {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Text('등록된 챌린지가 없어요!',
            style: TextStyle(color: kGrey.withOpacity(0.8), fontSize: kMedium),
            textAlign: TextAlign.center),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text('+버튼을 눌러',
            style: TextStyle(color: kGrey.withOpacity(0.8), fontSize: kMedium),
            textAlign: TextAlign.center),
      ),
      Text('챌린지를 등록해주세요.',
          style: TextStyle(color: kGrey.withOpacity(0.8), fontSize: kMedium),
          textAlign: TextAlign.center),
      Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text('👇🏻',
            style: TextStyle(fontSize: kBig), textAlign: TextAlign.center),
      ),
    ],
  ));
}

Widget partlyEmpty(str) {
  return Center(
    child: Text(str,
        style: TextStyle(color: kGrey.withOpacity(0.8), fontSize: kMedium),
        textAlign: TextAlign.center),
  );
}

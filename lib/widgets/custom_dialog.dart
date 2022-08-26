import 'package:flutter/material.dart';

import '../constants.dart';

Widget customDialog(context, title, content, btn, onDelete) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: kBorderRadiusL),
    actionsAlignment:
        btn == '삭제' ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
    contentPadding: const EdgeInsets.only(top: 30, bottom: 10),
    title: Center(
      child: Text(title, style: TextStyle(color: kBlack, fontSize: kLarge)),
    ),
    content: Text(
      content,
      style: TextStyle(color: kBlack, fontSize: kMedium),
      textAlign: TextAlign.center,
    ),
    actions: btn == '삭제'
        ? [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(primary: kGrey),
              child:
                  Text('취소', style: TextStyle(color: kGrey, fontSize: kSmall)),
            ),
            TextButton(
              onPressed: onDelete,
              style: TextButton.styleFrom(primary: kGrey),
              child:
                  Text(btn, style: TextStyle(color: kDelete, fontSize: kSmall)),
            ),
          ]
        : [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(primary: kGrey),
              child:
                  Text('확인', style: TextStyle(color: kPoint, fontSize: kSmall)),
            )
          ],
  );
}

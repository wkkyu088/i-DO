import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDialog extends StatelessWidget {
  String title;
  String content;
  String btn;
  dynamic onDelete;
  bool isClose;
  CustomDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.btn,
    this.onDelete,
    this.isClose = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: kBorderRadiusM),
      actionsAlignment: btn == '삭제'
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.center,
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
                  isClose ? Navigator.pop(context) : null;
                },
                style: TextButton.styleFrom(primary: kGrey),
                child: Text('취소',
                    style: TextStyle(color: kGrey, fontSize: kSmall)),
              ),
              TextButton(
                onPressed: onDelete,
                style: TextButton.styleFrom(primary: kGrey),
                child: Text(btn,
                    style: TextStyle(color: kDelete, fontSize: kSmall)),
              ),
            ]
          : [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  isClose ? Navigator.pop(context) : null;
                },
                style: TextButton.styleFrom(primary: kGrey),
                child: Text('확인',
                    style: TextStyle(color: kPoint, fontSize: kSmall)),
              )
            ],
    );
  }
}

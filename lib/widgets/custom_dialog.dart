import 'package:flutter/material.dart';
import 'package:ido/models/utils.dart';
import 'package:ido/widgets/toast_message.dart';

import '../constants.dart';
import '../models/test.dart';

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

Widget modifyDialog(context, id) {
  final controller = TextEditingController();
  controller.text = items[id]!.title;

  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: kBorderRadiusL),
    actionsAlignment: MainAxisAlignment.spaceEvenly,
    contentPadding: const EdgeInsets.only(top: 30, bottom: 10),
    title: Center(
      child:
          Text('챌린지 이름 수정', style: TextStyle(color: kBlack, fontSize: kLarge)),
    ),
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        maxLines: 1,
        maxLength: 20,
        style: TextStyle(fontSize: kMedium),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPoint, width: 1),
            borderRadius: kBorderRadiusM,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kGrey, width: 1),
            borderRadius: kBorderRadiusM,
          ),
          hintText: '수정할 이름을 입력하세요.',
          hintStyle: TextStyle(fontSize: kMedium, color: kGrey),
          counterStyle: TextStyle(fontSize: kTiny, color: kGrey),
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: TextButton.styleFrom(primary: kGrey),
        child: Text('취소', style: TextStyle(color: kGrey, fontSize: kSmall)),
      ),
      TextButton(
        onPressed: () {
          updateItem(id, controller.text);
          Navigator.pop(context);
          toastMessages(context, '수정되었습니다.');
        },
        style: TextButton.styleFrom(primary: kGrey),
        child: Text('수정', style: TextStyle(color: kPoint, fontSize: kSmall)),
      )
    ],
  );
}

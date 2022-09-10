import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import '../constants.dart';
import '../models/utils.dart';
import 'custom_dialog.dart';
import 'modify_dialog.dart';
import 'toast_message.dart';

Widget challengeCard(
    context, id, colors, days, title, startDate, endDate, isDone, onPressed,
    [key]) {
  final double width = MediaQuery.of(context).size.width;

  Widget badge(mode) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
          width: width * 0.8 * 0.19,
          height: width * 0.8 * 0.19,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(22),
                  bottomLeft: Radius.circular(22)),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: const [0.5, 0.5],
                  colors: mode == '성공'
                      ? [kSuccess.withOpacity(0.9), kWhite]
                      : [kFailure.withOpacity(0.9), kWhite])),
          child: Center(
            child: Transform.rotate(
              angle: 45 * math.pi / 180,
              child: Container(
                margin: EdgeInsets.only(top: width * 0.8 * 0.1),
                child: Text(
                  mode == '성공' ? '성공' : '실패',
                  style: TextStyle(color: kWhite, fontSize: kXSmall),
                ),
              ),
            ),
          )),
    );
  }

  return Container(
    margin: EdgeInsets.only(
        bottom: width * 0.04, left: width * 0.1, right: width * 0.1),
    child: GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: kBorderRadiusM),
              insetPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              buttonPadding: EdgeInsets.zero,
              actionsPadding: EdgeInsets.zero,
              contentPadding: const EdgeInsets.symmetric(vertical: 5),
              content: Container(
                alignment: Alignment.center,
                height: 100,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return modifyDialog(id: id, isClose: true);
                            });
                      },
                      style: TextButton.styleFrom(primary: kLightGrey),
                      child: Text('수정',
                          style: TextStyle(color: kBlack, fontSize: kMedium)),
                    ),
                    Container(
                      height: 1,
                      color: kLightGrey,
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
                                onDelete: () {
                                  deleteItem(id);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  toastMessages(context, '삭제되었습니다.');
                                },
                                isClose: true,
                              );
                            });
                      },
                      style: TextButton.styleFrom(primary: kLightGrey),
                      child: Text('삭제',
                          style: TextStyle(color: kBlack, fontSize: kMedium)),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          primary: kGrey,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: kBorderRadiusL),
        ),
        child: Stack(
          children: [
            Container(
              height: width * 0.8 * 0.49,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colorChart[colors][1].withOpacity(0.25),
                borderRadius: kBorderRadiusL,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                    margin: const EdgeInsets.only(bottom: 2),
                    decoration: BoxDecoration(
                        borderRadius: kBorderRadiusL,
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              colorChart[colors][0],
                              colorChart[colors][1]
                            ])),
                    child: Text(
                      '$days일',
                      style: TextStyle(color: kWhite, fontSize: kXSmall + 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: colorChart[colors][0], fontSize: kBig + 1),
                    ),
                  ),
                  Text(
                    '${DateFormat('yy.MM.dd').format(startDate)} ~ ${DateFormat('yy.MM.dd').format(endDate)}',
                    style: TextStyle(color: kGrey, fontSize: kXSmall + 1),
                  ),
                ],
              ),
            ),
            isDone == '성공'
                ? badge('성공')
                : isDone == '실패'
                    ? badge('실패')
                    : Container()
          ],
        ),
      ),
    ),
  );
}

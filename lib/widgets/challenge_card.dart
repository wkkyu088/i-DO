import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import '../constants.dart';

Widget challengeCard(context, cIndex, days, title, startDate, endDate, isDone) {
  final double width = MediaQuery.of(context).size.width;

  Widget badge(mode) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(22),
                  bottomLeft: Radius.circular(22)),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: const [0.5, 0.5],
                  colors:
                      mode == '성공' ? [kSuccess, kWhite] : [kFailure, kWhite])),
          child: Center(
            child: Transform.rotate(
              angle: 45 * math.pi / 180,
              child: Container(
                margin: const EdgeInsets.only(top: 27),
                child: Text(
                  mode == '성공' ? '성공' : '실패',
                  style: TextStyle(color: kWhite, fontSize: kSubText),
                ),
              ),
            ),
          )),
    );
  }

  return Container(
    margin: EdgeInsets.only(bottom: 20, left: width * 0.1, right: width * 0.1),
    child: GestureDetector(
      onLongPress: () {},
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          primary: kGrey,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: kBorderRadiusL),
        ),
        child: Stack(
          children: [
            Container(
              width: width * 0.8,
              height: width * 0.8 * 0.49,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colors[cIndex][1].withOpacity(0.25),
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
                            colors: [colors[cIndex][0], colors[cIndex][1]])),
                    child: Text(
                      '$days일',
                      style: TextStyle(color: kWhite, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      '$title',
                      style: TextStyle(color: colors[cIndex][0], fontSize: 30),
                    ),
                  ),
                  Text(
                    '${DateFormat('yy.MM.dd').format(startDate)} ~ ${DateFormat('yy.MM.dd').format(endDate)}',
                    style: TextStyle(color: kGrey, fontSize: 18),
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

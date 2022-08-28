import 'package:flutter/material.dart';
import 'package:ido/widgets/custom_dialog.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import 'package:ido/models/test.dart';
import '../constants.dart';

class ChallengeScreen extends StatefulWidget {
  String id;
  ChallengeScreen({Key? key, required this.id}) : super(key: key);

  // get days => item.days;
  // get title => item.title;
  // get startDate => item.startDate;
  // get endDate => item.endDate;
  // get colors => item.colors;
  // get contents => item.contents;
  // get isDone => item.isDone;

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // 0: default, 1: done, 2: undone, 3: today, 4: todayDone
    final ScrollController _controller = ScrollController();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    List<String> msgs = [
      '오늘도 실천하셨네요! 정말 대단해요 😍',
      '한걸음 한걸음, 성공을 향해! 💪🏻',
      '$user님의 성공을 응원합니다!'
    ];

    Widget badge(mode) {
      return Align(
        alignment: Alignment.topRight,
        child: Container(
            width: width * 0.8 * 0.2,
            height: width * 0.8 * 0.2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    stops: const [0.5, 0.5],
                    colors: mode == '성공'
                        ? [kWhite, kSuccess]
                        : [kWhite, kFailure])),
            child: Center(
              child: Transform.rotate(
                angle: 45 * math.pi / 180,
                child: Container(
                  margin: EdgeInsets.only(bottom: width * 0.8 * 0.1),
                  child: Text(
                    mode == '성공' ? '성공' : '실패',
                    style: TextStyle(color: kWhite, fontSize: kSmall),
                  ),
                ),
              ),
            )),
      );
    }

    messages() {
      return showDialog(
          context: context,
          barrierColor: Colors.transparent,
          builder: (BuildContext context) {
            Future.delayed(const Duration(milliseconds: 1500), () {
              Navigator.pop(context);
            });

            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: kBorderRadiusL),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              insetPadding: EdgeInsets.only(bottom: height * 0.76),
              elevation: 0,
              backgroundColor: kBlack.withOpacity(0.4),
              content: Builder(
                builder: (context) {
                  return Container(
                      height: 18,
                      alignment: Alignment.center,
                      child: Text(
                        msgs[math.Random().nextInt(msgs.length)],
                        style: TextStyle(color: kWhite, fontSize: kSmall),
                      ));
                },
              ),
            );
          });
    }

    // 오늘 날짜로 애니메이션
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   int index = 0;
    //   for (int i = 0; i < widget.days; i++) {
    //     if (widget.contents[i] == 3 || widget.contents[i] == 4) {
    //       index = i;
    //       break;
    //     }
    //   }
    //   if (index > 45) {
    //     _controller.animateTo(
    //       (index ~/ 5 + 1) * ((width - width * 0.24) / 5 - 5) - 200,
    //       duration: const Duration(seconds: 2),
    //       curve: Curves.fastOutSlowIn,
    //     );
    //   }
    // });

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          toolbarHeight: height * 0.09,
          iconTheme: IconThemeData(color: kBlack),
          centerTitle: true,
          elevation: 0,
          backgroundColor: kWhite,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: kBlack,
                size: kIcon + 2,
              )),
          actions: [
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
                      return customDialog(context, '잠시만요!', '정말 삭제하시나요?', '삭제',
                          () {
                        items.remove(widget.id);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
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
          ]),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 9),
                        margin: const EdgeInsets.only(bottom: 2),
                        decoration: BoxDecoration(
                            borderRadius: kBorderRadiusL,
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  items[widget.id]!.colors[0],
                                  items[widget.id]!.colors[1]
                                ])),
                        child: Text(
                          '${items[widget.id]!.days}일',
                          style:
                              TextStyle(color: kWhite, fontSize: kXSmall + 1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          items[widget.id]!.title,
                          style: TextStyle(
                              color: items[widget.id]!.colors[0],
                              fontSize: kBig + 1),
                        ),
                      ),
                      Text(
                        '${DateFormat('yy.MM.dd').format(items[widget.id]!.startDate)} ~ ${DateFormat('yy.MM.dd').format(items[widget.id]!.endDate)}',
                        style: TextStyle(color: kGrey, fontSize: kXSmall + 1),
                      ),
                    ],
                  ),
                ),
              ),
              items[widget.id]!.isDone == '성공'
                  ? badge('성공')
                  : items[widget.id]!.isDone == '실패'
                      ? badge('실패')
                      : Container()
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  left: width * 0.12,
                  right: width * 0.12,
                  top: width * 0.08,
                  bottom: width * 0.05),
              child: GridView.builder(
                  controller: _controller,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 9.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: items[widget.id]!.days,
                  itemBuilder: (BuildContext context, int i) {
                    return items[widget.id]!.contents[i] == 3 ||
                            items[widget.id]!.contents[i] == 4
                        ? Tooltip(
                            message: DateFormat('yy.MM.dd').format(
                                items[widget.id]!
                                    .startDate
                                    .add(Duration(days: i))),
                            decoration: BoxDecoration(
                              borderRadius: kBorderRadiusL,
                              color: kBlack.withOpacity(0.6),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: items[widget.id]!.contents[i] == 4
                                      ? LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                              items[widget.id]!.colors[0],
                                              items[widget.id]!.colors[1]
                                            ])
                                      : null),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (items[widget.id]!.contents[i] == 3) {
                                      items[widget.id]!.contents[i] = 4;
                                      if (i == items[widget.id]!.days - 1) {
                                        items[widget.id]!.isDone == '성공'
                                            ? showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return customDialog(
                                                      context,
                                                      '챌린지 성공',
                                                      '성공을 축하합니다! 🥳',
                                                      '확인',
                                                      null);
                                                })
                                            : showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return customDialog(
                                                      context,
                                                      '챌린지 실패',
                                                      '괜찮아요, 그럴 수 있죠 😅',
                                                      '확인',
                                                      null);
                                                });
                                      } else {
                                        messages();
                                      }
                                    } else {
                                      items[widget.id]!.contents[i] = 3;
                                    }
                                  });
                                },
                                style: TextButton.styleFrom(
                                    primary: kGrey,
                                    backgroundColor:
                                        items[widget.id]!.contents[i] == 4
                                            ? Colors.transparent
                                            : kWhite,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    side: items[widget.id]!.contents[i] == 4
                                        ? null
                                        : BorderSide(
                                            color:
                                                items[widget.id]!.colors[0])),
                                child: Text(
                                  (i + 1).toString(),
                                  style: TextStyle(
                                      color: items[widget.id]!.contents[i] == 4
                                          ? Colors.transparent
                                          : items[widget.id]!.colors[0],
                                      fontSize: kSmall + 1),
                                ),
                              ),
                            ),
                          )
                        : Tooltip(
                            message: DateFormat('yy.MM.dd').format(
                                items[widget.id]!
                                    .startDate
                                    .add(Duration(days: i))),
                            decoration: BoxDecoration(
                              borderRadius: kBorderRadiusL,
                              color: kBlack.withOpacity(0.6),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: items[widget.id]!.contents[i] == 0
                                      ? kLightGrey.withOpacity(0.5)
                                      : kWhite,
                                  gradient: items[widget.id]!.contents[i] == 1
                                      ? LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                              items[widget.id]!.colors[0],
                                              items[widget.id]!.colors[1]
                                            ])
                                      : items[widget.id]!.contents[i] == 2
                                          ? LinearGradient(
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight,
                                              colors: [kGrey, kLightGrey])
                                          : null,
                                  border: items[widget.id]!.contents[i] == 3
                                      ? Border.all(
                                          color: items[widget.id]!.colors[0],
                                          width: 1)
                                      : null),
                              child: Center(
                                child: Text(
                                  (i + 1).toString(),
                                  style: TextStyle(
                                      color: items[widget.id]!.contents[i] == 1
                                          ? Colors.transparent
                                          : items[widget.id]!.contents[i] == 2
                                              ? kWhite
                                              : i == items[widget.id]!.days - 1
                                                  ? items[widget.id]!.colors[0]
                                                  : items[widget.id]!
                                                              .contents[i] ==
                                                          0
                                                      ? kGrey
                                                      : null,
                                      fontSize: kSmall + 1),
                                ),
                              ),
                            ),
                          );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

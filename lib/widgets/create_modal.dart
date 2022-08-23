import 'package:flutter/material.dart';
import 'package:ido/widgets/floating_button.dart';

import '../constants.dart';

class CreateModal extends StatefulWidget {
  const CreateModal({Key? key}) : super(key: key);

  @override
  State<CreateModal> createState() => _CreateModalState();
}

class _CreateModalState extends State<CreateModal> {
  final selectedColor = [kLightGrey, kLightGrey];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    Widget customTitle(title, subTitle) {
      return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(title, style: TextStyle(color: kBlack, fontSize: kContentS)),
              Text(subTitle,
                  style: TextStyle(
                      color: kGrey,
                      fontSize: kSubText - 5,
                      fontFamily: 'NanumSquareB')),
            ]),
      );
    }

    Widget customTextField(hint, align, verticalPadding) {
      return TextField(
        textAlign: align,
        maxLines: 1,
        style: TextStyle(fontSize: kContentS - 2, color: kBlack),
        decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          hintStyle: TextStyle(fontSize: kContentS - 2, color: kGrey),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10, vertical: verticalPadding),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kGrey),
            borderRadius: kBorderRadiusM,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kGrey),
            borderRadius: kBorderRadiusM,
          ),
        ),
      );
    }

    Widget buttonItem(s) {
      return Container(
          width: width * 0.8 / 3 - 13.5,
          height: 32,
          alignment: Alignment.center,
          child: Text(s, style: TextStyle(fontSize: kContentS - 2)));
    }

    return Stack(
      children: [
        Container(
            width: width,
            height: 545,
            margin: EdgeInsets.only(
                left: width * 0.09,
                right: width * 0.09,
                top: 34,
                bottom: 30 + keyboardHeight),
            padding:
                const EdgeInsets.only(top: 25, bottom: 10, left: 22, right: 22),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: kBorderRadiusXL,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 15,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                // 모달 설명
                SizedBox(
                    // color: Colors.amber[100],
                    height: 76,
                    child: Row(
                      children: [
                        Text('새로운 ',
                            style:
                                TextStyle(color: kBlack, fontSize: kTitle + 2)),
                        Text('챌린지 ',
                            style:
                                TextStyle(color: kPoint, fontSize: kTitle + 2)),
                        Text('만들기!',
                            style:
                                TextStyle(color: kBlack, fontSize: kTitle + 2)),
                      ],
                    )),
                // 챌린지 이름 입력
                SizedBox(
                    // color: Colors.blue[100],
                    height: 95,
                    child: Column(
                      children: [
                        customTitle('이름', '챌린지의 이름 입력'),
                        customTextField('이름을 입력하세요', TextAlign.left, 10.0),
                      ],
                    )),
                // 챌린지 기간 입력
                SizedBox(
                    // color: Colors.red[100],
                    height: 125,
                    child: Column(
                      children: [
                        customTitle('기간', '챌린지를 수행할 기간 선택'),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: ToggleButtons(
                            isSelected: days,
                            onPressed: (int index) {
                              setState(() {
                                for (int i = 0; i < days.length; i++) {
                                  if (i == index) {
                                    days[i] = true;
                                  } else {
                                    days[i] = false;
                                  }
                                }
                              });
                            },
                            splashColor: kPoint,
                            selectedColor: kWhite,
                            color: kBlack,
                            fillColor: kPoint,
                            selectedBorderColor: kGrey,
                            borderRadius: kBorderRadiusM,
                            borderColor: kGrey,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            constraints: const BoxConstraints(),
                            children: [
                              buttonItem('30일'),
                              buttonItem('100일'),
                              buttonItem('365일')
                            ],
                          ),
                        ),
                        customTextField(
                            '자유롭게 입력 (1~365)', TextAlign.center, 8.0),
                      ],
                    )),
                // 챌린지 색상 선택
                SizedBox(
                    // color: Colors.green[100],
                    height: 150,
                    child: Column(
                      children: [
                        customTitle('색상', '챌린지의 색상 선택'),
                        Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        selectedColor[0],
                                        selectedColor[1]
                                      ])),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 100,
                                margin: const EdgeInsets.only(left: 5),
                                // color: Colors.amber,
                                child: GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 5.0,
                                      crossAxisSpacing: 5.0,
                                      childAspectRatio: 1.0,
                                    ),
                                    itemCount: colors.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedColor[0] = colors[index][0];
                                            selectedColor[1] = colors[index][1];
                                            for (int i = 0;
                                                i < checked.length;
                                                i++) {
                                              if (i == index) {
                                                checked[i] = true;
                                              } else {
                                                checked[i] = false;
                                              }
                                            }
                                          });
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: kBorderRadiusS,
                                                  border: checked[index]
                                                      ? Border.all(
                                                          color: kBlack,
                                                          width: 2)
                                                      : const Border(),
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.bottomLeft,
                                                      end: Alignment.topRight,
                                                      colors: [
                                                        colors[index][0],
                                                        colors[index][1]
                                                      ])),
                                            ),
                                            checked[index]
                                                ? Center(
                                                    child: Icon(
                                                      Icons.check_rounded,
                                                      color: kBlack,
                                                      size: 24,
                                                    ),
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
                // 만들기 버튼
                Container(
                    width: width,
                    // color: Colors.purple[100],
                    alignment: Alignment.center,
                    height: 62,
                    child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            primary: kBlack,
                            backgroundColor: kPoint,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            shape: RoundedRectangleBorder(
                                borderRadius: kBorderRadiusXL)),
                        child: Text(
                          '만들기',
                          style:
                              TextStyle(color: kWhite, fontSize: kContentM - 1),
                        )))
              ],
            )),
        Align(
            alignment: Alignment.topCenter,
            child: floatingButton(context, 'close')),
      ],
    );
  }
}

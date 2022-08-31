import 'package:flutter/material.dart';
import 'package:ido/models/utils.dart';
import 'package:ido/widgets/custom_dialog.dart';
import 'package:ido/widgets/floating_button.dart';
import '../screens/challenge_screen.dart';

import '../constants.dart';

class CreateModal extends StatefulWidget {
  const CreateModal({Key? key}) : super(key: key);

  @override
  State<CreateModal> createState() => _CreateModalState();
}

class _CreateModalState extends State<CreateModal> {
  String nameValue = "";
  String dateValue = "30";
  TextEditingController dateInputController = TextEditingController();
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    Widget customTitle(title, subTitle) {
      return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(title, style: TextStyle(color: kBlack, fontSize: kSmall)),
              Text(subTitle,
                  style: TextStyle(
                      color: kGrey,
                      fontSize: kTiny,
                      fontFamily: 'NanumSquareB')),
            ]),
      );
    }

    Widget customTextField(hint, align, verticalPadding, onChanged) {
      return TextField(
        controller: verticalPadding == 8 ? dateInputController : null,
        textAlign: align,
        maxLines: 1,
        maxLength: verticalPadding == 8 ? 3 : 20,
        style: TextStyle(fontSize: kSmall, color: kBlack),
        keyboardType: verticalPadding == 8 ? TextInputType.number : null,
        onChanged: onChanged,
        onTap: verticalPadding == 8
            ? () {
                for (int i = 0; i < days.length; i++) {
                  days[i] = false;
                }
              }
            : null,
        decoration: InputDecoration(
            isDense: true,
            hintText: hint,
            hintStyle: TextStyle(fontSize: kSmall, color: kGrey),
            counterText: verticalPadding == 8 ? '' : null,
            counterStyle: TextStyle(fontSize: kTiny - 1, color: kGrey),
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
            suffixText: verticalPadding == 8 ? '일' : null,
            suffixStyle: TextStyle(fontSize: kSmall, color: kGrey)),
      );
    }

    Widget buttonItem(s) {
      return Container(
          width: (width - width * 0.18 - 44) / 3,
          height: 30,
          alignment: Alignment.center,
          child: Text(s, style: TextStyle(fontSize: kSmall)));
    }

    return Stack(
      children: [
        Container(
            width: width,
            margin: EdgeInsets.only(
                left: width * 0.09,
                right: width * 0.09,
                top: 30,
                bottom: 30 + keyboardHeight),
            padding:
                const EdgeInsets.only(top: 35, bottom: 10, left: 20, right: 20),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 모달 설명
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Text('새로운 ',
                            style: TextStyle(color: kBlack, fontSize: kLarge)),
                        Text('챌린지 ',
                            style: TextStyle(color: kPoint, fontSize: kLarge)),
                        Text('만들기!',
                            style: TextStyle(color: kBlack, fontSize: kLarge)),
                      ],
                    )),
                // 챌린지 이름 입력
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        customTitle('이름', '챌린지의 이름 입력'),
                        customTextField('이름을 입력하세요', TextAlign.left, 10.0, (v) {
                          setState(() {
                            nameValue = v;
                          });
                        }),
                      ],
                    )),
                // 챌린지 기간 입력
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                                    dateInputController.clear();
                                  } else {
                                    days[i] = false;
                                    dateInputController.clear();
                                  }
                                }
                                if (index == 0) {
                                  dateValue = '30';
                                } else if (index == 1) {
                                  dateValue = '100';
                                } else if (index == 2) {
                                  dateValue = '365';
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
                            '자유롭게 입력 (1~365)', TextAlign.center, 8.0, (v) {
                          setState(() {
                            dateValue = dateInputController.text;
                          });
                        }),
                      ],
                    )),
                // 챌린지 색상 선택
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        customTitle('색상', '챌린지의 색상 선택'),
                        Row(
                          children: [
                            Container(
                              width: width * 0.25,
                              height: width * 0.25,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        colorChart[selectedColor][0],
                                        colorChart[selectedColor][1]
                                      ])),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: width * 0.25,
                                margin: const EdgeInsets.only(left: 5),
                                child: GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 4.0,
                                      crossAxisSpacing: 4.0,
                                      childAspectRatio: 1.0,
                                    ),
                                    itemCount: colorChart.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedColor = index;
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
                                                        colorChart[index][0],
                                                        colorChart[index][1]
                                                      ])),
                                            ),
                                            checked[index]
                                                ? Center(
                                                    child: Icon(
                                                      Icons.check_rounded,
                                                      color: kBlack,
                                                      size: kIcon,
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
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {
                          String id =
                              DateTime.now().microsecondsSinceEpoch.toString();

                          createItem(
                            id,
                            dateValue,
                            nameValue,
                            selectedColor,
                            DateTime.now(),
                            [3] + List<int>.filled(int.parse(dateValue) - 1, 0),
                            '',
                          );

                          // 최신순으로 정렬해서 해야하나...?
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChallengeScreen(id: id)));
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return customDialog(context, 'NEW',
                                    '새로운 챌린지가 생성되었습니다! ✨', '확인', null);
                              });

                          for (int i = 0; i < checked.length; i++) {
                            if (checked[i] == true) checked[i] = false;
                          }
                          if (days[0] == false) days[0] = true;
                          if (days[1] == true) days[1] = false;
                          if (days[2] == true) days[2] = false;
                        },
                        style: TextButton.styleFrom(
                            primary: kBlack,
                            backgroundColor: kPoint,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            minimumSize: const Size(0, 0),
                            shape: RoundedRectangleBorder(
                                borderRadius: kBorderRadiusXL)),
                        child: Text('만들기',
                            style:
                                TextStyle(color: kWhite, fontSize: kSmall)))),
              ],
            )),
        Align(
            alignment: Alignment.topCenter,
            child: floatingButton(context, 'close')),
      ],
    );
  }
}

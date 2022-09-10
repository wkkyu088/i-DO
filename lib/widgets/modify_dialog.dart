import 'package:flutter/material.dart';
import 'package:ido/models/utils.dart';
import 'package:ido/widgets/challenge_card.dart';
import 'package:ido/widgets/toast_message.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../models/test.dart';

class modifyDialog extends StatefulWidget {
  String id;
  bool isClose;
  modifyDialog({Key? key, required this.id, this.isClose = false})
      : super(key: key);

  @override
  State<modifyDialog> createState() => modifyDialogState();
}

class modifyDialogState extends State<modifyDialog> {
  int selectedColor = 10;

  @override
  void initState() {
    super.initState();
    selectedColor = items[widget.id]!.colors;
    for (int i = 0; i < checked.length; i++) {
      if (i == items[widget.id]!.colors) {
        if (checked[i] == false) checked[i] = true;
      } else {
        if (checked[i] == true) checked[i] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final controller = TextEditingController();
    controller.text = items[widget.id]!.title;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: kBorderRadiusL),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      contentPadding: const EdgeInsets.only(top: 30, bottom: 10),
      content: SizedBox(
        width: width * 0.72,
        height: 290,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text('챌린지 수정',
                  style: TextStyle(color: kBlack, fontSize: kLarge)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: kBorderRadiusL,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('미리보기',
                          style: TextStyle(color: kGrey, fontSize: kTiny)),
                    ),
                    Container(
                      height: width * 0.35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: colorChart[selectedColor][1].withOpacity(0.25),
                        borderRadius: kBorderRadiusM,
                      ),
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
                                      colorChart[selectedColor][0],
                                      colorChart[selectedColor][1]
                                    ])),
                            child: Text(
                              '${items[widget.id]!.days}일',
                              style:
                                  TextStyle(color: kWhite, fontSize: kXSmall),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: TextField(
                                autofocus: true,
                                controller: controller,
                                textAlign: TextAlign.center,
                                cursorColor: kBlack,
                                maxLines: 1,
                                maxLength: 20,
                                style: TextStyle(
                                  fontSize: kXLarge,
                                  color: colorChart[selectedColor][0],
                                ),
                                decoration: InputDecoration(
                                  isDense: true,
                                  isCollapsed: true,
                                  counterText: '',
                                  hintText: '수정할 제목을 입력하세요',
                                  hintStyle: TextStyle(
                                      fontSize: kXLarge, color: kGrey),
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                              )),
                          Text(
                            '${DateFormat('yy.MM.dd').format(items[widget.id]!.startDate)} ~ ${DateFormat('yy.MM.dd').format(items[widget.id]!.endDate)}',
                            style: TextStyle(color: kGrey, fontSize: kXSmall),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
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
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = index;
                            for (int i = 0; i < checked.length; i++) {
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
                                      ? Border.all(color: kBlack, width: 2)
                                      : const Border(),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
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
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            widget.isClose ? Navigator.pop(context) : null;
          },
          style: TextButton.styleFrom(primary: kGrey),
          child: Text('취소', style: TextStyle(color: kGrey, fontSize: kSmall)),
        ),
        TextButton(
          onPressed: () {
            updateItem(widget.id, 'title', controller.text);
            updateItem(widget.id, 'colors', selectedColor);
            Navigator.pop(context);
            widget.isClose ? Navigator.pop(context) : null;
            toastMessages(context, '수정되었습니다.');
          },
          style: TextButton.styleFrom(primary: kGrey),
          child: Text('수정', style: TextStyle(color: kPoint, fontSize: kSmall)),
        )
      ],
    );
  }
}

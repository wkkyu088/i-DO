import 'package:flutter/material.dart';

import '../constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
        backgroundColor: kWhite,
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'i',
                    style: TextStyle(color: kPoint, fontSize: 60),
                  ),
                  Text(
                    'DO',
                    style: TextStyle(color: kBlack, fontSize: 60),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  width: 250,
                  child: TextField(
                    controller: controller,
                    maxLines: 1,
                    maxLength: 10,
                    style: TextStyle(fontSize: kMedium),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPoint, width: 1),
                        borderRadius: kBorderRadiusM,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kGrey, width: 1),
                        borderRadius: kBorderRadiusM,
                      ),
                      hintText: '닉네임을 입력하세요.',
                      hintStyle: TextStyle(fontSize: kMedium, color: kGrey),
                      helperText: '언제든지 설정에서 변경할 수 있습니다.',
                      helperStyle: TextStyle(color: kGrey, fontSize: kTiny),
                      counterText: '',
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Center(
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        primary: kPoint,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        '시작하기 >',
                        style: TextStyle(color: kPoint, fontSize: kBig + 2),
                      )),
                )),
          ],
        ));
  }
}

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/custom_appbar.dart';

class DisplaySettingScreen extends StatefulWidget {
  const DisplaySettingScreen({Key? key}) : super(key: key);

  @override
  State<DisplaySettingScreen> createState() => _DisplaySettingScreenState();
}

class _DisplaySettingScreenState extends State<DisplaySettingScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var font = selectedfont;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    Widget customTile(title) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 10,
                child: Icon(Icons.circle, color: kBlack, size: 7),
              ),
              Text(title, style: TextStyle(fontSize: kMedium))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: kWhite,
                backgroundColor: kBlack,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(borderRadius: kBorderRadiusM),
              ),
              child: Text("저장", style: TextStyle(fontSize: kXSmall)),
            ),
          )
        ],
      );
    }

    Widget spacer() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        color: kLightGrey,
        height: 0.6,
      );
    }

    Widget sampleText(txt) {
      return Text(
        txt,
        style: TextStyle(
            color: kBlack, fontSize: kSmall, height: 1.2, fontFamily: font),
      );
    }

    Widget fontTile(txt, family) {
      return ListTile(
        title: Text(txt,
            style: TextStyle(
              color: kBlack,
              fontFamily: family,
              fontSize: kMedium,
            )),
        leading: family == font
            ? Icon(Icons.radio_button_checked, color: kBlack)
            : Icon(Icons.radio_button_unchecked, color: kBlack),
        minLeadingWidth: 20,
        onTap: () {
          // selectedfont = family;
          font = family;
          setState(() {});
        },
      );
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar('', '화면 설정', scaffoldKey, context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 5),
            customTile('폰트 변경'),
            Container(
              width: width,
              height: 180,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: kBorderRadiusM,
                border: Border.all(color: kBlack, width: 0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sampleText("가나다라마바사아자차카타파하"),
                  sampleText("ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
                  sampleText("abcdefghijklmnopqrstuvwxyz"),
                  sampleText("1234567890!@#\$%^&*()"),
                ],
              ),
            ),
            fontTile("배민주아체", "BMJUA"),
            fontTile("프리텐다드", "PretendardB"),
            fontTile("나눔스퀘어", "NanumSquareB"),
          ],
        ),
      ),
    );
  }
}

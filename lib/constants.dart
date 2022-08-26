import 'package:flutter/material.dart';

String user = '규진';

// Colors
Color kWhite = const Color(0xFFFAFAFA);
Color kBlack = const Color(0xFF262626);
Color kGrey = const Color(0xFFBFBFBF);
Color kLightGrey = const Color(0xFFE7E6E6);

Color kPoint = const Color(0xFF93B4F5);
Color kBtn1 = const Color(0xFF7DA8FF);
Color kBtn2 = const Color(0xFFCCDCFD);

Color kSuccess = const Color(0xFF72C486);
Color kFailure = const Color(0xFFF46A6A);
Color kDelete = const Color(0xFFDA0000);

// FontSize
double kSplash = 54;
double kBig = 24;
double kXLarge = 22;
double kLarge = 20;
double kMedium = 18;
double kSmall = 16;
double kXSmall = 14;
double kTiny = 12;

double kIcon = 22;

// BorderRdius
BorderRadius kBorderRadiusXL = BorderRadius.circular(30.0);
BorderRadius kBorderRadiusL = BorderRadius.circular(22.0);
BorderRadius kBorderRadiusM = BorderRadius.circular(10.0);
BorderRadius kBorderRadiusS = BorderRadius.circular(8.0);

// AppBar Title
String kMainTitle = '전체 챌린지';
String kMainIcon = '👀';

String kPreviousTitle = '지난 챌린지';
String kPreviousIcon = '⌛';

String kPresentTitle = '현재 챌린지';
String kPresentIcon = '⏳';

String kSuccessTitle = '성공한 챌린지';
String kSuccessIcon = '❗';

String kFailureTitle = '실패한 챌린지';
String kFailureIcon = '❓';

// create_modal 관련
final List<bool> days = [true, false, false];
final List<bool> checked = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];
final List colors = [
  // [const Color(0xFFfcb69f), const Color(0xFFffecd2)],
  // [const Color(0xFFfda085), const Color(0xFFf6d365)],
  // [const Color(0xFFfcb69f), const Color(0xFFffecd2)],
  // [const Color(0xFFfbc2eb), const Color(0xFFa6c1ee)],
  [const Color(0xFFEC7B97), const Color.fromARGB(255, 255, 203, 216)],
  [const Color(0xFFF8A14B), const Color.fromARGB(255, 250, 213, 176)],
  [const Color(0xFF875ACC), const Color.fromARGB(255, 195, 172, 230)],
  [const Color(0xFF7CAC5D), const Color.fromARGB(255, 186, 220, 164)],
  [const Color(0xFFa1c4fd), const Color(0xFFc2e9fb)],
  [const Color(0xFFff9a9e), const Color(0xFFfad0c4)],
  [const Color(0xFFace0f9), const Color(0xFFfff1eb)],
  [const Color(0xFFe6e9f0), const Color(0xFFeef1f5)],
  [const Color(0xFFf5576c), const Color(0xFFFBB7C5)],
  [const Color(0xFF96e6a1), const Color(0xFFf9f586)],
  [const Color(0xFFe0c3fc), const Color(0xFF8ec5fc)],
  [const Color(0xFF84fab0), const Color(0xFF8fd3f4)],
  [const Color(0xFF96fbc4), const Color(0xFFd4fc79)],
  [const Color(0xFFebbba7), const Color(0xFFcfc7f8)],
  [const Color(0xFFc1dfc4), const Color(0xFdeecddF)],
  [const Color(0xFF8989ba), const Color(0xFFa7a6cb)],
  [const Color(0xFFff9a9e), const Color(0xFFfad0c4)],
  [const Color(0xFFfda085), const Color(0xFFf6d365)],
  [const Color(0xFFfbc2eb), const Color(0xFFa6c1ee)],
  [const Color(0xFFf5576c), const Color(0xFFFBB7C5)],
];

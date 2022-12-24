import 'package:flutter/material.dart';

String userName = "";
String uid = "";

// Colors
Color kWhite = const Color(0xFFFAFAFA);
Color kBlack = const Color(0xFF262626);
Color kGrey = const Color(0xFFBFBFBF);
Color kMediumGrey = const Color(0xFFD3D3D3);
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
List<bool> checked = List.filled(colorChart.length, false);
final List colorChart = [
  [const Color(0xFF7DA8FF), const Color(0xFFCCDCFD)], // 1
  [const Color(0xFFa1c4fd), const Color(0xFFc2e9fb)], // 2
  [const Color(0xFF3A66BE), const Color(0xFFB3C9F4)], // 3
  [const Color(0xFF213B5D), const Color(0xFF6692CB)], // 4
  [const Color(0xFF9BB6E3), const Color(0xFFE5CCEB)], // 5
  [const Color(0xFFD6B9F1), const Color(0xFFA3CFFC)], // 6
  [const Color(0xFF8989ba), const Color(0xFFa7a6cb)], // 7
  [const Color(0xFF8C65AC), const Color(0xFFCFB8E0)], // 8
  [const Color(0xFFA6DADE), const Color(0xFFFFDBD3)], // 9
  [const Color(0xFF53A693), const Color(0xFF8BDEC2)], // 10
  [const Color(0xFF65CCB8), const Color(0xFFace0f9)], // 11
  [const Color(0xFF00cdac), const Color(0xFF8ddad5)], // 12
  [const Color(0xFF00ABC0), const Color(0xFFE8E6E1)], // 13
  [const Color(0xFF13547A), const Color(0xFF80d0c7)], // 14
  [const Color(0xFF95E29E), const Color(0xFFF1ED86)], // 15
  [const Color(0xFF60C98F), const Color(0xFFCEF378)], // 16
  [const Color(0xFF7CAC5D), const Color(0xFFBADCA4)], // 17
  [const Color(0xFF1A4119), const Color(0xFF8CC28B)], // 18
  [const Color(0xFF99BA9E), const Color(0xFCE4C2D5)], // 19
  [const Color(0xFFebbba7), const Color(0xFFcfc7f8)], // 20
  [const Color(0xFFdf9a9e), const Color(0xFFdad0c4)], // 21
  [const Color(0xFFff9a9e), const Color(0xFFfad0c4)], // 22
  [const Color(0xFFEC7B97), const Color(0xFFFFCBD8)], // 23
  [const Color(0xFFFC5D9D), const Color(0xFFF8C596)], // 24
  [const Color(0xFFF03750), const Color(0xFFF8B1BF)], // 25
  [const Color(0xFFE94343), const Color(0xFFBA709D)], // 26
  [const Color(0xFFD95A80), const Color(0xFF6763AD)], // 27
  [const Color(0xFF891431), const Color(0xFFE6A1B9)], // 28
  [const Color(0xFFfcb69f), const Color(0xFFFBE4C3)], // 29
  [const Color(0xFFF8A14B), const Color(0xFFFAD5B0)], // 30
  [const Color(0xFFFFAA01), const Color(0xFFFFED4B)], // 31
  [const Color(0xFFED504B), const Color(0xFFFFCA76)], // 32
  [const Color(0xFF843C35), const Color(0xFFF4C0A8)], // 33
  [const Color(0xFFB58274), const Color(0xFFdfa579)], // 34
  [const Color(0xFF573E2D), const Color(0xFFC7A18C)], // 35
  [const Color(0xFF808384), const Color(0xFFCED4D8)], // 36
  [const Color(0xFF4C5255), const Color(0xFF868f96)], // 37
  [const Color(0xFF0F0F0D), const Color(0xFFBE1829)], // 38
];

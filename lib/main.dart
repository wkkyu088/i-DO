import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ido/screens/splash_screen.dart';

import './screens/main_list_screen.dart';
import './constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'BMJUA',
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            )),
        // home: const SplashScreen(),
        home: const MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: kWhite,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: kWhite,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      key: scaffoldKey,
      body: const MainListScreen(),
    );
  }
}

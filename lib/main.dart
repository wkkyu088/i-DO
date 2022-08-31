import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ido/screens/signUp_screen.dart';
import 'package:ido/screens/splash_screen.dart';

import './screens/main_list_screen.dart';
import './constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'BMJUA',
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: kPoint,
              onPrimary: kPoint,
              secondary: kGrey,
              onSecondary: kGrey,
              error: kPoint,
              onError: kPoint,
              background: kWhite,
              onBackground: kWhite,
              surface: kLightGrey,
              onSurface: kLightGrey),
          textSelectionTheme: TextSelectionThemeData(
              cursorColor: kPoint,
              selectionHandleColor: kPoint,
              selectionColor: kPoint.withOpacity(0.5)),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          )),
      home: const SplashScreen(),
      // home: const MainPage(),
      // home: const SignUpScreen(),
    );
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

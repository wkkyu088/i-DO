import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ido/screens/login_screen.dart';

import '../constants.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() async {
    return Timer(const Duration(seconds: 2), initApp);
  }

  void initApp() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    print(currentUser);

    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen()));
    } else {
      var user = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .get();
      final v = user.data() as Map;
      userName = v['userName'];
      uid = currentUser.uid;
      email = v['email'];
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const MainPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('i', style: TextStyle(color: kPoint, fontSize: kSplash)),
            Text('DO', style: TextStyle(color: kBlack, fontSize: kSplash))
          ],
        ),
      ),
    );
  }
}

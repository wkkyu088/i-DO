// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ido/main.dart';

import '../constants.dart';
import '../widgets/toast_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final emailCont = TextEditingController();
    final pwCont = TextEditingController();

    return Scaffold(
        backgroundColor: kWhite,
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'i',
                          style: TextStyle(color: kPoint, fontSize: 50),
                        ),
                        Text(
                          'DO',
                          style: TextStyle(color: kBlack, fontSize: 50),
                        ),
                      ],
                    ),
                  ),
                  // Text(userName),
                  // Text(uid),
                  // Text(items.toString()),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      "안녕, 반가워요 👋🏻",
                      style: TextStyle(color: kGrey, fontSize: kXSmall),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 70),
            //   child: TextButton(
            //     onPressed: () {},
            //     style: TextButton.styleFrom(
            //       primary: kGrey,
            //       backgroundColor: Colors.transparent,
            //       shape: RoundedRectangleBorder(borderRadius: kBorderRadiusM),
            //       side: BorderSide(color: kMediumGrey, width: 1),
            //       padding: const EdgeInsets.symmetric(vertical: 15),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Container(
            //           height: 20,
            //           padding: const EdgeInsets.only(right: 10),
            //           child: Image.asset('assets/images/glogo.png'),
            //         ),
            //         Text(
            //           "구글로 로그인",
            //           style: TextStyle(fontSize: kSmall, color: kBlack),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       width: (screenWidth - 180) / 2,
            //       decoration: BoxDecoration(
            //         border: Border(
            //           top: BorderSide(color: kGrey, width: 0.8),
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            //       child: Text("or",
            //           style: TextStyle(fontSize: kSmall, color: kGrey)),
            //     ),
            //     Container(
            //       width: (screenWidth - 180) / 2,
            //       decoration: BoxDecoration(
            //         border: Border(
            //           top: BorderSide(color: kGrey, width: 0.8),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: TextField(
                    controller: emailCont,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: kSmall),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail_rounded),
                      isCollapsed: true,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPoint, width: 1),
                        borderRadius: kBorderRadiusM,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kMediumGrey, width: 1),
                        borderRadius: kBorderRadiusM,
                      ),
                      hintText: '이메일',
                      hintStyle:
                          TextStyle(fontSize: kSmall, color: kMediumGrey),
                      counterText: '',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  child: TextField(
                    controller: pwCont,
                    maxLines: 1,
                    maxLength: 20,
                    obscureText: true,
                    obscuringCharacter: "*",
                    style: TextStyle(fontSize: kSmall),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_rounded),
                      isCollapsed: true,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPoint, width: 1),
                        borderRadius: kBorderRadiusM,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kMediumGrey, width: 1),
                        borderRadius: kBorderRadiusM,
                      ),
                      hintText: '비밀번호',
                      hintStyle:
                          TextStyle(fontSize: kSmall, color: kMediumGrey),
                      counterText: '',
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () async {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .signInWithEmailAndPassword(
                                  email: emailCont.text, password: pwCont.text);
                          if (userCredential.user != null) {
                            print("로그인 성공");
                            var user = await FirebaseFirestore.instance
                                .collection('users')
                                .doc(userCredential.user!.uid)
                                .get();
                            final v = user.data() as Map;
                            userName = v['userName'];
                            uid = userCredential.user!.uid;
                            print(userName);
                            print(uid);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('등록되지 않은 이메일');
                            toastMessages(context, "등록되지 않은 이메일입니다.");
                          } else if (e.code == 'wrong-password') {
                            print('비밀번호가 틀림');
                            toastMessages(context, "비밀번호가 틀렸습니다.");
                          } else if (e.code == 'invalid-email') {
                            print('잘못된 이메일 형식');
                            toastMessages(context, "잘못된 이메일 형식입니다.");
                          } else {
                            print(e.code);
                          }
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: kPoint,
                        backgroundColor: kPoint,
                        shape: RoundedRectangleBorder(
                            borderRadius: kBorderRadiusL),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        minimumSize: Size(screenWidth - 120, 50),
                      ),
                      child: Text(
                        '로그인',
                        style: TextStyle(color: kWhite, fontSize: kLarge),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () async {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: emailCont.text, password: pwCont.text);
                          if (userCredential.user != null) {
                            print("회원가입 성공");
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(userCredential.user!.uid)
                                .set({
                              'userName': emailCont.text,
                              'email': emailCont.text
                            });
                            userName = emailCont.text.substring(0, 5);
                            uid = userCredential.user!.uid;
                            print(userName);
                            print(uid);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'email-already-in-use') {
                            print('이미 계정이 있음');
                            toastMessages(context, "이미 있는 계정입니다.");
                          } else if (e.code == 'weak-password') {
                            print('비밀번호가 너무 약함');
                            toastMessages(context, "비밀번호가 너무 약합니다.");
                          } else if (e.code == 'invalid-email') {
                            print('잘못된 이메일 형식');
                            toastMessages(context, "잘못된 이메일 형식입니다.");
                          } else {
                            print('${e.code} : 알 수 없는 오류');
                          }
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: kPoint,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: kBorderRadiusL),
                        side: BorderSide(color: kPoint, width: 1),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        minimumSize: Size(screenWidth - 120, 50),
                      ),
                      child: Text(
                        '회원가입',
                        style: TextStyle(color: kPoint, fontSize: kLarge),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

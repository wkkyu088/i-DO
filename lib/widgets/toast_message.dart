import 'package:flutter/material.dart';

import '../constants.dart';

toastMessages(context, msg) {
  final double height = MediaQuery.of(context).size.height;

  return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        Future.delayed(const Duration(milliseconds: 1500), () {
          Navigator.pop(context);
        });

        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: kBorderRadiusL),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          insetPadding: EdgeInsets.only(bottom: height * 0.85),
          elevation: 0,
          backgroundColor: kBlack.withOpacity(0.4),
          content: Builder(
            builder: (context) {
              return Container(
                  height: 18,
                  alignment: Alignment.center,
                  child: Text(
                    msg,
                    style: TextStyle(color: kWhite, fontSize: kSmall),
                  ));
            },
          ),
        );
      });
}

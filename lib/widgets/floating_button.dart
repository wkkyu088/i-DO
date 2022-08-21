import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import '../constants.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({Key? key}) : super(key: key);

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: kBorderRadiusL),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: kBorderRadiusL,
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [kBtn1, kBtn2])),
        child: const Icon(
          Icons.add_rounded,
          size: 45,
        ),
      ),
    );
  }
}

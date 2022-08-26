import 'package:flutter/material.dart';

import './create_modal.dart';
import '../constants.dart';

Widget floatingButton(context, mode) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.15,
    height: MediaQuery.of(context).size.width * 0.15,
    child: FittedBox(
      child: FloatingActionButton(
        onPressed: () {
          mode == 'open'
              ? showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  constraints: BoxConstraints.loose(Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.85)),
                  builder: (BuildContext context) {
                    return const SingleChildScrollView(child: CreateModal());
                  },
                )
              : {
                  Navigator.pop(context),
                  for (int i = 0; i < checked.length; i++)
                    {if (checked[i] == true) checked[i] = false},
                  if (days[0] == false) days[0] = true,
                  if (days[1] == true) days[1] = false,
                  if (days[2] == true) days[2] = false,
                };
        },
        elevation: mode == 'open' ? 6 : 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(borderRadius: kBorderRadiusL),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.16,
          height: MediaQuery.of(context).size.width * 0.16,
          decoration: BoxDecoration(
              borderRadius: kBorderRadiusL,
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [kBtn1, kBtn2])),
          child: mode == 'open'
              ? Icon(Icons.add_rounded, color: kWhite, size: 44)
              : Icon(Icons.close_rounded, color: kWhite, size: 42),
        ),
      ),
    ),
  );
}

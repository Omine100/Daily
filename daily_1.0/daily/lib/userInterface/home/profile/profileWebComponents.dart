import 'package:flutter/material.dart';
import 'package:daily/themesLocal/colors.dart';

Widget profileWebCard(BuildContext context, State state, bool isSmall) {
  return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Center(
            child: profileInfo(context),
          ),
          SizedBox(
            height: 15,
          ),
          profileContent(context, isSmall),
        ],
      ));
}

Widget profileInfo(BuildContext context) {
  return Container(
    child: Text(
      "TESTING",
      style: TextStyle(fontSize: 30),
    ),
  );
}

Widget profileContent(BuildContext context, bool isSmall) {
  return Container();
}

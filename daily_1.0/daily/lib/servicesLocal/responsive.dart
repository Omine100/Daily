import 'package:flutter/material.dart';

bool isSmall = false;

void setResponsiveState(BuildContext context) {
  if (MediaQuery.of(context).size.width >= 900)
    isSmall = false;
  else
    isSmall = true;
}

bool getIsSmall(BuildContext context) {
  return MediaQuery.of(context).size.width < 900 ? true : false;
}

class Responsive extends StatelessWidget {
  final Widget small;
  final Widget large;

  const Responsive({
    Key key,
    @required this.small,
    @required this.large,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
          isSmall = false;
          return large;
        } else {
          isSmall = true;
          return small;
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/systemManagement.dart';

class Responsive extends StatelessWidget {
  final Widget small;
  final Widget large;

  const Responsive({
    Key key,
    @required this.small,
    @required this.large,
  }) : super(key: key);

  static bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < 900;

  static bool isLarge(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
          setResponsiveness(ResponsiveStates.large);
          return large;
        } else {
          setResponsiveness(ResponsiveStates.small);
          return small;
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AnimationStandards {
  //MECHANICS
  PageTransition pageTransitionEase(BuildContext context, Widget newPage) {
    return PageTransition(
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeInOutCirc,
      type: PageTransitionType.scale,
      alignment: Alignment.bottomCenter,
      child: newPage,
    );
  }
}
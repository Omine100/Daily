import 'package:flutter/material.dart';

import 'package:daily/schemesLocal/themes.dart';
import 'package:daily/standardProperties/gradientStandards.dart';

class Gradients {
  //CLASS INITIALIZATION
  GradientStandards gradientStandards = new GradientStandards();
  Themes themes = new Themes();

  //MECHANICS
  Shader signUpButtonGradient(BuildContext context) {
    Shader shader = gradientStandards.textLinearGradient(
        context,
        themes.getColor(context, "backgroundGradientTopRightColor"),
        themes.getColor(context, "backgroundGradientBottomLeftColor"));
    return shader;
  }

  LinearGradient welcomeScreenGradient(BuildContext context) {
    LinearGradient linearGradient = gradientStandards.bodyLinearGradient(
        context,
        themes.getColor(context, "backgroundGradientTopRightColor"),
        themes.getColor(context, "backgroundGradientBottomLeftColor"),
        false);
    return linearGradient;
  }

  LinearGradient loginScreenGradient(BuildContext context) {
    LinearGradient linearGradient = gradientStandards.bodyLinearGradient(
        context,
        themes.getColor(context, "backgroundGradientTopRightColor"),
        themes.getColor(context, "backgroundGradientBottomLeftColor"),
        false);
    return linearGradient;
  }

  LinearGradient forgotPasswordScreenGradient(BuildContext context) {
    LinearGradient linearGradient = gradientStandards.bodyLinearGradient(
        context,
        themes.getColor(context, "backgroundGradientTopRightColor"),
        themes.getColor(context, "backgroundGradientBottomLeftColor"),
        false);
    return linearGradient;
  }
}
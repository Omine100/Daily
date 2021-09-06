import 'package:flutter/material.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/standards/gradientStandards.dart';

class Gradients {
  //CLASS INITIALIZATION
  GradientStandards gradientStandards = new GradientStandards();

  //MECHANICS
  Shader signUpButtonGradient(BuildContext context) {
    Shader shader = gradientStandards.textLinearGradient(
        context,
        Theme.of(context).colorScheme.gradientsBackgroundTopRight,
        Theme.of(context).colorScheme.gradientsBackgroundBottomLeft);
    return shader;
  }

  LinearGradient welcomeScreenGradient(BuildContext context) {
    LinearGradient linearGradient = gradientStandards.bodyLinearGradient(
        context,
        Theme.of(context).colorScheme.gradientsBackgroundTopRight,
        Theme.of(context).colorScheme.gradientsBackgroundBottomLeft,
        false);
    return linearGradient;
  }

  LinearGradient loginScreenGradient(BuildContext context) {
    LinearGradient linearGradient = gradientStandards.bodyLinearGradient(
        context,
        Theme.of(context).colorScheme.gradientsBackgroundTopRight,
        Theme.of(context).colorScheme.gradientsBackgroundBottomLeft,
        false);
    return linearGradient;
  }

  LinearGradient forgotPasswordScreenGradient(BuildContext context) {
    LinearGradient linearGradient = gradientStandards.bodyLinearGradient(
        context,
        Theme.of(context).colorScheme.gradientsBackgroundTopRight,
        Theme.of(context).colorScheme.gradientsBackgroundBottomLeft,
        false);
    return linearGradient;
  }
}

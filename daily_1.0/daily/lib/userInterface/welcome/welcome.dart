import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';
import 'package:daily/userInterface/welcome/welcomeWebComponents.dart';
import 'package:daily/userInterface/welcome/welcomeMobileComponents.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  welcomeScreenSmall() {
    return Adaptive(
        iOS: welcomeScreenMobileSmall(false),
        android: welcomeScreenMobileSmall(true),
        web: welcomeScreenWebSmall());
  }

  welcomeScreenLarge() {
    return Adaptive(
        iOS: welcomeScreenMobileLarge(false),
        android: welcomeScreenMobileLarge(true),
        web: welcomeScreenWebLarge());
  }

  welcomeScreenWebSmall() {
    return context.router.push(AuthScreen(isSignIn: true));
  }

  welcomeScreenWebLarge() {
    return context.router.push(AuthScreen(isSignIn: true));
  }

  welcomeScreenMobileSmall(bool isAndroid) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.welcomeMobileTitleTop),
          child: welcomeTitle(context),
        ),
        Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.welcomeMobileCornerTop),
          right: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.welcomeMobileCornerRight),
          child: welcomeCorner(context),
        ),
        Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.welcomeMobileCarouselTop),
          child: welcomeCarousel(this, context),
        ),
        Positioned(
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .welcomeMobileGetStartedTop),
          child: welcomeGetStarted(context),
        ),
        Positioned(
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .welcomeMobileAccountAlreadyTop),
          child: welcomeAccountAlready(context),
        ),
      ],
    );
  }

  welcomeScreenMobileLarge(bool isAndroid) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.welcomeMobileTitleTop),
          child: welcomeTitle(context),
        ),
        Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.welcomeMobileCornerTop),
          right: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.welcomeMobileCornerRight),
          child: welcomeCorner(context),
        ),
        Positioned(
          top: getPosition(context, true,
              Theme.of(context).materialTapTargetSize.welcomeMobileCarouselTop),
          child: welcomeCarousel(this, context),
        ),
        Positioned(
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .welcomeMobileGetStartedTop),
          child: welcomeGetStarted(context),
        ),
        Positioned(
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .welcomeMobileAccountAlreadyTop),
          child: welcomeAccountAlready(context),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: Container(
          color: Theme.of(context).colorScheme.welcomeBackground,
          constraints: BoxConstraints.expand(height: double.maxFinite),
          child: Responsive(
            small: welcomeScreenSmall(),
            large: welcomeScreenLarge(),
          )),
    ));
  }
}

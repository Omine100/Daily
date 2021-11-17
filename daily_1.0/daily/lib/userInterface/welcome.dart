import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:daily/userInterface/welcomeComponents.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).colorScheme.welcomeBackground,
        child: Container(
            constraints: BoxConstraints.expand(height: double.maxFinite),
            child: Responsive(
              desktop: welcomeScreenDesktop(this, context),
              tablet: welcomeScreenTablet(this, context),
              mobile: welcomeScreenMobile(this, context),
            )));
  }
}

welcomeScreenDesktop(State state, BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.welcomeDesktopTitleTop),
        child: welcomeTitle(context),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.welcomeDesktopCornerTop),
        right: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.welcomeDesktopCornerRight),
        child: welcomeCorner(context),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.welcomeDesktopCarouselTop),
        child: welcomeCarousel(state, context),
      ),
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .welcomeDesktopGetStartedTop),
        child: welcomeGetStarted(context),
      ),
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .welcomeDesktopAccountAlreadyTop),
        child: welcomeAccountAlready(context),
      ),
    ],
  );
}

welcomeScreenTablet(State state, BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.welcomeTabletTitleTop),
        child: welcomeTitle(context),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.welcomeTabletCornerTop),
        right: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.welcomeTabletCornerRight),
        child: welcomeCorner(context),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.welcomeTabletCarouselTop),
        child: welcomeCarousel(state, context),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.welcomeTabletGetStartedTop),
        child: welcomeGetStarted(context),
      ),
      Positioned(
        top: getPosition(
            context,
            true,
            Theme.of(context)
                .materialTapTargetSize
                .welcomeTabletAccountAlreadyTop),
        child: welcomeAccountAlready(context),
      ),
    ],
  );
}

welcomeScreenMobile(State state, BuildContext context) {
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
        child: welcomeCarousel(state, context),
      ),
      Positioned(
        top: getPosition(context, true,
            Theme.of(context).materialTapTargetSize.welcomeMobileGetStartedTop),
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

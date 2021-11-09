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
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.welcomeBackground,),
          child: Container(
                  constraints: BoxConstraints.expand(height: double.maxFinite),
                  child: Responsive(
                    desktop: welcomeScreenDesktop(this, context),
                    tablet: welcomeScreenTablet(this, context),
                    mobile: welcomeScreenMobile(this, context),
                  ))),
    );
  }
}

welcomeScreenDesktop(State state, BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeDesktopTitleTop),
        child: WelcomeTitle(),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeDesktopCarouselTop),
        child: welcomeCarousel(state, context),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeDesktopGetStartedTop),
        child: WelcomeGetStarted(),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeDesktopAccountAlreadyTop),
        child: WelcomeAccountAlready(),
      ),
    ],
  );
}

welcomeScreenTablet(State state, BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeTabletTitleTop),
        child: WelcomeTitle(),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeTabletCarouselTop),
        child: welcomeCarousel(state, context),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeTabletGetStartedTop),
        child: WelcomeGetStarted(),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeTabletAccountAlreadyTop),
        child: WelcomeAccountAlready(),
      ),
    ],
  );
}

welcomeScreenMobile(State state, BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeMobileTitleTop),
        child: WelcomeTitle(),
      ),
      Positioned(
        top: 0,
        right: -5,
        child: WelcomeCorner(),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeMobileCarouselTop),
        child: welcomeCarousel(state, context),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeMobileGetStartedTop),
        child: WelcomeGetStarted(),
      ),
      Positioned(
        top: getPosition(context, true, Theme.of(context).materialTapTargetSize.welcomeMobileAccountAlreadyTop),
        child: WelcomeAccountAlready(),
      ),
    ],
  );
}

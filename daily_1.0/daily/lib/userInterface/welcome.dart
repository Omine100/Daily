import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/responsive.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/userInterface/welcomeComponents.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/positions.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  welcomeScreenWeb() {
    return IconButton(
        onPressed: () {
          AutoRouter.of(context).pushNamed("/auth");
        },
        icon: Icon(
          Icons.person,
          size: 55,
        ));
  }

  welcomeScreenTablet() {
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
          child: welcomeCarousel(this, context),
        ),
        Positioned(
          top: getPosition(
              context,
              true,
              Theme.of(context)
                  .materialTapTargetSize
                  .welcomeTabletGetStartedTop),
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

  welcomeScreenMobile() {
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
            web: welcomeScreenWeb(),
            tablet: welcomeScreenTablet(),
            mobile: welcomeScreenMobile(),
          )),
    ));
  }
}

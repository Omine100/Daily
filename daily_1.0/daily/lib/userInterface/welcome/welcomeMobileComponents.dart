import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';

Widget welcomeMobileTitle(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 20),
    width: getDimension(context, false,
        Theme.of(context).visualDensity.welcomeMobileTitleWidth),
    child: Text(
      getTranslated(context, "welcomeTitle"),
      style: TextStyle(
        color: Theme.of(context).colorScheme.welcomeMobileTitle,
        fontSize: Theme.of(context).textTheme.welcomeMobileTitle,
        fontWeight: Theme.of(context).typography.welcomeMobileTitle,
      ),
    ),
  );
}

Widget welcomeMobileCenterPiece(BuildContext context) {
  return Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.welcomeMobileCenterPieceHeight),
      child: Image(
          fit: BoxFit.fitHeight,
          image: isDark.value
              ? AssetImage("lib/assets/auth/web/auth_centerPiece_dark.jpg")
              : AssetImage("lib/assets/auth/web/auth_centerPiece_light.jpg")));
}

Widget welcomeMobileCardContainer(BuildContext context, State state) {
  return SingleChildScrollView(
    child: Container(
      constraints: BoxConstraints(minHeight: 100, minWidth: 100),
      height: 250,
      width: 335,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.authWebCard,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: welcomeMobileCard(context, state),
    ),
  );
}

Widget welcomeMobileCard(BuildContext context, State state) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          welcomeMobileCardText(context),
          welcomeMobileGetStarted(context),
        ],
      ),
      Positioned(
        bottom: 5,
        child: welcomeMobileAccountAlready(context),
      ),
    ],
  );
}

Widget welcomeMobileCardText(BuildContext context) {
  return Column(
    children: [
      Text(
        "Testing",
        // getTranslated(context, "welcomeCardText"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.welcomeMobileCardText,
          fontSize: Theme.of(context).textTheme.welcomeMobileCardText,
          fontWeight: Theme.of(context).typography.welcomeMobileCardText,
        ),
      ),
      Text(
        "Testing testing testing testing",
        // getTranslated(context, "welcomeCardSubText"),
        style: TextStyle(
          color: Theme.of(context).colorScheme.welcomeMobileCardSubText,
          fontSize: Theme.of(context).textTheme.welcomeMobileCardSubText,
          fontWeight: Theme.of(context).typography.welcomeMobileCardSubText,
        ),
      ),
    ],
  );
}

Widget welcomeMobileGetStarted(BuildContext context) {
  return Center(
    child: Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.welcomeMobileGetStartedHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.welcomeMobileGetStartedWidth),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.welcomeMobileGetStarted,
          borderRadius: BorderRadius.circular(30)),
      child: Material(
        color: Theme.of(context).colorScheme.materialTransparent,
        child: InkWell(
          splashColor:
              Theme.of(context).colorScheme.welcomeMobileGetStartedInkWell,
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onTap: () {
            context.router.push(AuthScreen(isSignIn: false));
          },
          child: Container(
            child: Center(
              child: Text(
                getTranslated(context, "welcomeGetStarted"),
                style: TextStyle(
                  color:
                      Theme.of(context).colorScheme.welcomeMobileGetStartedText,
                  fontSize:
                      Theme.of(context).textTheme.welcomeMobileGetStartedText,
                  fontWeight:
                      Theme.of(context).typography.welcomeMobileGetStartedText,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget welcomeMobileAccountAlready(BuildContext context) {
  return GestureDetector(
    onTap: () {
      context.router.push(AuthScreen(isSignIn: true));
    },
    child: Center(
      child: RichText(
        text: TextSpan(
          text: getTranslated(context, "welcomeAccountAlready"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.welcomeMobileAccountAlready,
            fontSize: Theme.of(context).textTheme.welcomeMobileAccountAlready,
            fontWeight:
                Theme.of(context).typography.welcomeMobileAccountAlready,
          ),
          children: <TextSpan>[
            TextSpan(
              text: getTranslated(context, "welcomeAccountAlreadyLogin"),
              style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .welcomeMobileAccountAlreadyLogin,
                fontSize: Theme.of(context)
                    .textTheme
                    .welcomeMobileAccountAlreadyLogin,
                fontWeight: Theme.of(context)
                    .typography
                    .welcomeMobileAccountAlreadyLogin,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

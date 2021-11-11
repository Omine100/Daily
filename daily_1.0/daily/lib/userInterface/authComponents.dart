import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/servicesLocal/mediaManagement.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';
import 'package:daily/userInterface/home.dart';

Widget authTitle(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 20),
    width: getDimension(
        context, false, Theme.of(context).visualDensity.welcomeTitleWidth),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslated(context, "loginTitle"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.welcomeTitle,
            fontSize: Theme.of(context).textTheme.welcomeTitle,
            fontWeight: Theme.of(context).typography.welcomeTitle,
          ),
        ),
        Text(
          getTranslated(context, "loginSubtitle"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.welcomeSubtitle,
            fontSize: Theme.of(context).textTheme.welcomeSubtitle,
            fontWeight: Theme.of(context).typography.welcomeSubtitle,
          ),
        ),
      ],
    ),
  );
}

class AuthUserInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {}
}

Widget authProgress(BuildContext context, bool isSignIn) {
  return Center(
    child: Container(
      height: getDimension(
          context, true, Theme.of(context).visualDensity.authGetStartedHeight),
      width: getDimension(
          context, false, Theme.of(context).visualDensity.authGetStartedWidth),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.authGetStarted,
          borderRadius: BorderRadius.circular(30)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Theme.of(context).colorScheme.authGetStartedInkWell,
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onTap: () {
            RouteNavigation().routePage(context, HomeScreen());
          },
          child: Container(
            child: Center(
              child: Text(
                getTranslated(context, isSignIn ? "authSignIn" : "authSignUp"),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.authGetStartedText,
                  fontSize: Theme.of(context).textTheme.authGetStartedText,
                  fontWeight: Theme.of(context).typography.authGetStartedText,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget authSwitch(BuildContext context, bool isSignIn) {
  return GestureDetector(
    onTap: () {
      RouteNavigation().routePage(context, HomeScreen());
    },
    child: Center(
      child: RichText(
        text: TextSpan(
          text: getTranslated(context, "welcomeAccountAlready"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.welcomeAccountAlready,
            fontSize: Theme.of(context).textTheme.welcomeAccounAlready,
            fontWeight: Theme.of(context).typography.welcomeAccountAlready,
          ),
          children: <TextSpan>[
            TextSpan(
              text: getTranslated(context, "welcomeAccountAlreadyLogin"),
              style: TextStyle(
                color: Theme.of(context).colorScheme.welcomeAccountAlreadyLogin,
                fontSize: Theme.of(context).textTheme.welcomeAccounAlreadyLogin,
                fontWeight:
                    Theme.of(context).typography.welcomeAccountAlreadyLogin,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget authProfilePicker(BuildContext context, State state) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.red,
    ),
    child: IconButton(
      onPressed: () {
        MediaManagement().showImagePicker(context, true, state);
      },
      icon: Icon(
        Icons.person,
        color: Colors.white,
        size: 30,
      ),
    ),
  );
}

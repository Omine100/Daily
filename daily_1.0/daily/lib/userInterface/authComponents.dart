import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/standards/userIStandards.dart';
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
  bool isSignIn;
  AuthUserInput(this.isSignIn);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
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

List<Image> _images = [
  Image(image: AssetImage("lib/assets/auth_carouselOne.png")),
  Image(image: AssetImage("lib/assets/auth_carouselTwo.png")),
  Image(image: AssetImage("lib/assets/auth_carouselThree.png")),
  Image(image: AssetImage("lib/assets/auth_carouselFour.png")),
  Image(image: AssetImage("lib/assets/auth_carouselFive.png")),
];
Widget authProfilePicker(BuildContext context, State state) {
  return GestureDetector(
    onTap: () {
      //Need this to return an image file so we can send it to firebaseAccounts
      UserIStandards().showMediaSelectionDialog(context, state);
    },
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.red.shade200,
      ),
      child: CarouselSlider(
        items: _images,
        options: CarouselOptions(
          autoPlay: true,
          autoPlayAnimationDuration: Duration(seconds: 3),
          viewportFraction: 1.5,
          enlargeCenterPage: true,
          aspectRatio: 1.0,
        ),
      ),
    ),
  );
}

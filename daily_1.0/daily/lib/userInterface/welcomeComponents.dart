import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';
import 'package:daily/userInterface/auth.dart';

Widget welcomeTitle(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 20),
    width: getDimension(
        context, false, Theme.of(context).visualDensity.welcomeTitleWidth),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslated(context, "welcomeTitle"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.welcomeTitle,
            fontSize: Theme.of(context).textTheme.welcomeTitle,
            fontWeight: Theme.of(context).typography.welcomeTitle,
          ),
        ),
        Text(
          getTranslated(context, "welcomeSubtitle"),
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

List<Image> _images = [
  Image(image: AssetImage("lib/assets/welcome/welcome_carouselOne.png")),
  Image(image: AssetImage("lib/assets/welcome/welcome_carouselTwo.png")),
  Image(image: AssetImage("lib/assets/welcome/welcome_carouselThree.png")),
];
int _current = 0;
Widget welcomeCarousel(State state, BuildContext context) {
  return Column(
    children: [
      Container(
        height: getDimension(context, true,
            Theme.of(context).visualDensity.welcomeCarouselHeight),
        width: getDimension(context, false,
            Theme.of(context).visualDensity.welcomeCarouselWidth),
        child: CarouselSlider(
          items: _images,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 1.0,
            onPageChanged: (index, reason) {
              state.setState(() {
                _current = index;
              });
            },
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _images.map(
          (image) {
            int index = _images.indexOf(image);
            return Container(
              width: 8,
              height: _current == index ? 30.0 : 15.0,
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 3.5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: _current == index
                      ? Theme.of(context).colorScheme.welcomeCarouselCurrent
                      : Theme.of(context)
                          .colorScheme
                          .welcomeCarouselNotCurrent),
            );
          },
        ).toList(), // this was the part the I had to add
      ),
    ],
  );
}

Widget welcomeCorner(BuildContext context) {
  return Container(
    height: getDimension(
        context, true, Theme.of(context).visualDensity.welcomeCornerHeight),
    width: getDimension(
        context, true, Theme.of(context).visualDensity.welcomeCornerHeight),
    child: Image(
      image: AssetImage("lib/assets/welcome_corner.png"),
    ),
  );
}

Widget welcomeGetStarted(BuildContext context) {
  return Center(
    child: Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.welcomeGetStartedHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.welcomeGetStartedWidth),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.welcomeGetStarted,
          borderRadius: BorderRadius.circular(30)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Theme.of(context).colorScheme.welcomeGetStartedInkWell,
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onTap: () {
            RouteNavigation().routePage(
                context,
                AuthScreen(
                  isSignIn: false,
                ));
          },
          child: Container(
            child: Center(
              child: Text(
                getTranslated(context, "welcomeGetStarted"),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.welcomeGetStartedText,
                  fontSize: Theme.of(context).textTheme.welcomeGetStartedText,
                  fontWeight:
                      Theme.of(context).typography.welcomeGetStartedText,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget welcomeAccountAlready(BuildContext context) {
  return GestureDetector(
    onTap: () {
      RouteNavigation().routePage(
          context,
          AuthScreen(
            isSignIn: true,
          ));
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

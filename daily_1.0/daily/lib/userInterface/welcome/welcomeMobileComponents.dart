import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';

Widget welcomeMobileTitle(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 20),
    width: getDimension(context, false,
        Theme.of(context).visualDensity.welcomeMobileTitleWidth),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslated(context, "welcomeTitle"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.welcomeMobileTitle,
            fontSize: Theme.of(context).textTheme.welcomeMobileTitle,
            fontWeight: Theme.of(context).typography.welcomeMobileTitle,
          ),
        ),
        Text(
          getTranslated(context, "welcomeSubtitle"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.welcomeMobileSubtitle,
            fontSize: Theme.of(context).textTheme.welcomeMobileSubtitle,
            fontWeight: Theme.of(context).typography.welcomeMobileSubtitle,
          ),
        ),
      ],
    ),
  );
}

List<Image> _images = [
  Image(image: AssetImage("lib/assets/welcome/mobile/welcome_carouselOne.png")),
  Image(image: AssetImage("lib/assets/welcome/mobile/welcome_carouselTwo.png")),
  Image(
      image: AssetImage("lib/assets/welcome/mobile/welcome_carouselThree.png")),
];
int _current = 0;
Widget welcomeMobileCarousel(State state, BuildContext context) {
  return Column(
    children: [
      Container(
        height: getDimension(context, true,
            Theme.of(context).visualDensity.welcomeMobileCarouselHeight),
        width: getDimension(context, false,
            Theme.of(context).visualDensity.welcomeMobileCarouselWidth),
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
              width: getDimension(
                  context,
                  false,
                  Theme.of(context)
                      .visualDensity
                      .welcomeMobileCarouselSelectorWidth),
              height: _current == index
                  ? getDimension(
                      context,
                      true,
                      Theme.of(context)
                          .visualDensity
                          .welcomeMobileCarouselSelectorHeightCurrent)
                  : getDimension(
                      context,
                      true,
                      Theme.of(context)
                          .visualDensity
                          .welcomeMobileCarouselSelectorHeightNotCurrent),
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 3.5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: _current == index
                      ? Theme.of(context)
                          .colorScheme
                          .welcomeMobileCarouselCurrent
                      : Theme.of(context)
                          .colorScheme
                          .welcomeMobileCarouselNotCurrent),
            );
          },
        ).toList(),
      ),
    ],
  );
}

Widget welcomeMobileCorner(BuildContext context) {
  return Container(
    height: getDimension(context, true,
        Theme.of(context).visualDensity.welcomeMobileCornerHeight),
    width: getDimension(context, true,
        Theme.of(context).visualDensity.welcomeMobileCornerHeight),
    child: Image(
      image: AssetImage("lib/assets/welcome/mobile/welcome_corner.png"),
    ),
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

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';
import 'package:daily/userInterface/welcome.dart';

class WelcomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      width: getDimension(context, false, Theme.of(context).visualDensity.welcomeTitleWidth),
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
}

List<Image> _images = [
    Image(image: AssetImage("lib/assets/welcome_carouselOne.png")),
    Image(image: AssetImage("lib/assets/welcome_carouselTwo.png")),
    Image(image: AssetImage("lib/assets/welcome_carouselThree.png")),
];
int _current = 0;
Widget WelcomeCarousel(State state, BuildContext context) {
  return Column(
      children: [
        Container(
          height: 400,
          width: 400,
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
        SizedBox(height: 20,),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _images.map((image) {     
            int index=_images.indexOf(image);
            return Container(
              width: 10,
              height: _current == index ? 30.0 : 20.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: _current == index
                      ? Colors.red
                      : Colors.grey.shade300
              ),
            );
          },
        ).toList(), // this was the part the I had to add
      ),
      ],
    );
}

class WelcomeGetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: getDimension(context, true, Theme.of(context).visualDensity.welcomeGetStartedHeight),
        width: getDimension(context, false, Theme.of(context).visualDensity.welcomeGetStartedWidth),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.welcomeGetStarted,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Center(
          child: Text(
            getTranslated(context, "welcomeGetStarted"),
            style: TextStyle(
              color: Theme.of(context).colorScheme.welcomeGetStartedText,
              fontSize: Theme.of(context).textTheme.welcomeGetStartedText,
              fontWeight: Theme.of(context).typography.welcomeGetStartedText,
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeAccountAlready extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: getTranslated(context, "welcomeAccountAlready"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.welcomeAccountAlready,
            fontSize: Theme.of(context).textTheme.welcomeAccounAlready,
            fontWeight: Theme.of(context).typography.welcomeAccountAlready,
          ),
          children: <TextSpan>[
            TextSpan(text: getTranslated(context, "welcomeAccountAlreadyLogin"), style: TextStyle(
              color: Theme.of(context).colorScheme.welcomeAccountAlreadyLogin,
              fontSize: Theme.of(context).textTheme.welcomeAccounAlreadyLogin,
              fontWeight: Theme.of(context).typography.welcomeAccountAlreadyLogin,
            ),),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/standards/userIStandards.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';
import 'package:daily/userInterface/home.dart';
import 'package:daily/utilities/managementUtil/validation.dart';

Widget authTitle(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 20),
    width: getDimension(
        context, false, Theme.of(context).visualDensity.authTitleWidth),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getTranslated(context, "authTitle"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.authTitle,
            fontSize: Theme.of(context).textTheme.authTitle,
            fontWeight: Theme.of(context).typography.authTitle,
          ),
        ),
        Text(
          getTranslated(context, "authSubtitle"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.authSubtitle,
            fontSize: Theme.of(context).textTheme.authSubtitle,
            fontWeight: Theme.of(context).typography.authSubtitle,
          ),
        ),
      ],
    ),
  );
}

bool isVisible = false;
Container authUserInputField(BuildContext context, Function validator,
    Function onSaved, String authForm, bool isVariable) {
  return Container(
    height: 60,
    width: 275,
    padding: EdgeInsets.only(top: 10, bottom: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.grey.shade200,
    ),
    child: TextFormField(
      obscureText: isVisible,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: getTranslated(context, authForm),
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.authUserInputDecoration,
          fontSize: Theme.of(context).textTheme.authUserInputDecoration,
          fontWeight: Theme.of(context).typography.authUserInputDecoration,
        ),
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.authUserInputDecoration,
          fontSize: Theme.of(context).textTheme.authUserInputDecoration,
          fontWeight: Theme.of(context).typography.authUserInputDecoration,
        ),
        prefixIcon: Icon(
          authForm != "authFormEmail"
              ? (authForm == "authFormPass" ? Icons.lock : Icons.person)
              : Icons.email,
          color: Theme.of(context).colorScheme.userIStandardsTextInputIcon,
        ),
        suffixIcon: isVariable
            ? IconButton(
                onPressed: () {
                  isVisible = !isVisible;
                },
                icon: Icon(Icons.lock),
              )
            : null,
      ),
    ),
  );
}

Widget authGetStarted(BuildContext context, bool isSignIn) {
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
          text: getTranslated(context,
              isSignIn ? "authSwitchSignInPrimary" : "authSwitchSignUpPrimary"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.authSwitchPrimary,
            fontSize: Theme.of(context).textTheme.authSwitchPrimary,
            fontWeight: Theme.of(context).typography.authSwitchPrimary,
          ),
          children: <TextSpan>[
            TextSpan(
              text: getTranslated(
                  context,
                  isSignIn
                      ? "authSwitchSignInSecondary"
                      : "authSwitchSignUpSecondary"),
              style: TextStyle(
                color: Theme.of(context).colorScheme.authSwitchSecondary,
                fontSize: Theme.of(context).textTheme.authSwitchSecondary,
                fontWeight: Theme.of(context).typography.authSwitchSecondary,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

List<Image> _images = [
  Image(image: AssetImage("lib/assets/auth/auth_carouselOne.png")),
  Image(image: AssetImage("lib/assets/auth/auth_carouselTwo.png")),
  Image(image: AssetImage("lib/assets/auth/auth_carouselThree.png")),
  Image(image: AssetImage("lib/assets/auth/auth_carouselFour.png")),
  Image(image: AssetImage("lib/assets/auth/auth_carouselFive.png")),
];
Widget authProfilePicker(BuildContext context, State state) {
  return GestureDetector(
    onTap: () {
      UserIStandards().mediaSelectionDialog(context, state).then(
          (file) => FirebaseAccounts().setCurrentUserProfilePicImage(file));
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

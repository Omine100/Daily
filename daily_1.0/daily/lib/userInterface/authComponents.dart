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
  final bool isSignIn;
  AuthUserInput(this.isSignIn);

  final formKey = new GlobalKey<FormState>();
  final String userName = "", userEmail = "", userPass = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          isSignIn
              ? TextFormField(
                  validator: (name) {
                    if (!isName(name))
                      return getTranslated(context, 'validatorNameFormat');
                    return null;
                  },
                  onSaved: (name) => userName,
                  decoration: authUserInputDecoration(context, "authFormName"),
                )
              : null,
          TextFormField(
            validator: (email) {
              if (!isEmail(email))
                return getTranslated(context, 'validatorEmailFormat');
              return null;
            },
            onSaved: (email) => userEmail,
            decoration: authUserInputDecoration(context, "authFormEmail"),
          ),
          TextFormField(
            validator: (pass) {
              if (!isPassword(pass))
                return getTranslated(context, 'validatorPassFormat');
              return null;
            },
            onSaved: (pass) => userPass,
            decoration: authUserInputDecoration(context, "authFormPass"),
          )
        ],
      ),
    );
  }
}

InputDecoration authUserInputDecoration(BuildContext context, String key) {
  return InputDecoration();
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

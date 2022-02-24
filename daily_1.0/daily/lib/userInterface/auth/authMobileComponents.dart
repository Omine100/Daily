import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontProperties.dart';

FirebaseAccounts firebaseAccounts = new FirebaseAccounts();
RouteNavigation routeNavigation = new RouteNavigation();

Widget authCenterPiece(BuildContext context, State state) {
  return Container(
      height: getDimension(
          context, true, Theme.of(context).visualDensity.authCenterPieceHeight),
      child: Image(image: AssetImage("lib/assets/auth/auth_centerPiece.png")));
}

List<Image> _images = [
  Image(image: AssetImage("lib/assets/welcome/welcome_carouselOne.png")),
  Image(image: AssetImage("lib/assets/welcome/welcome_carouselTwo.png")),
  Image(image: AssetImage("lib/assets/welcome/welcome_carouselThree.png")),
];
int _current = 0;
Widget authCarousel(BuildContext context, State state) {
  return Column(
    children: [
      Container(
        height: getDimension(context, true,
            Theme.of(context).visualDensity.welcomeCarouselHeight),
        child: CarouselSlider(
          items: _images,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 1.1,
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
              width: 40,
              height: _current == index ? 20 : 15,
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
        ).toList(),
      ),
    ],
  );
}

Widget authWebCard(BuildContext context, bool isSignIn) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width * 0.5,
    decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomLeft: Radius.circular(50))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [authWebTitle(context), authUserInput(context, isSignIn)],
    ),
  );
}

Widget authWebTitle(BuildContext context) {
  return Text(
    "Login to Daily",
    style: TextStyle(
      color: Colors.red,
      fontSize: 45,
      fontWeight: FontWeight.w500,
    ),
  );
}

String userName = "", userEmail = "", userPass = "", userPassVerify = "";
final formKey = GlobalKey<FormState>();
Widget authUserInput(BuildContext context, bool isSignIn) {
  return Form(
    key: formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isSignIn
            ? Container()
            : authUserInputField(
                context, (name) => {userName = name}, "authFormName", false),
        authUserInputField(
            context, (email) => {userEmail = email}, "authFormEmail", false),
        authUserInputField(
            context, (pass) => {userPass = pass}, "authFormPass", true),
        isSignIn
            ? Container()
            : authUserInputField(
                context,
                (passVerify) => {userPassVerify = passVerify},
                "authFormPassVerify",
                true),
      ],
    ),
  );
}

bool isVisible = false;
Widget authUserInputField(
    BuildContext context, Function onSaved, String authForm, bool isVariable) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: getDimension(context, true,
          Theme.of(context).visualDensity.authUserInputFieldHeight),
      width: getDimension(context, false,
          Theme.of(context).visualDensity.authUserInputFieldWidth),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Theme.of(context).colorScheme.authUserInputField,
      ),
      child: TextFormField(
        obscureText: isVariable ? !isVisible : false,
        onSaved: onSaved,
        autofocus: false,
        style: TextStyle(
            color: Theme.of(context).colorScheme.authUserInputFieldText),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: getTranslated(context, authForm),
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.authUserInputFieldDecoration,
            fontSize: Theme.of(context).textTheme.authUserInputFieldDecoration,
            fontWeight:
                Theme.of(context).typography.authUserInputFieldDecoration,
          ),
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.authUserInputFieldDecoration,
            fontSize: Theme.of(context).textTheme.authUserInputFieldDecoration,
            fontWeight:
                Theme.of(context).typography.authUserInputFieldDecoration,
          ),
          prefixIcon: Icon(
            authForm != "authFormEmail"
                ? (authForm == "authFormPass" ||
                        authForm == "authFormPassVerify"
                    ? Icons.lock
                    : Icons.person)
                : Icons.email,
            color:
                Theme.of(context).colorScheme.authUserInputFieldIconDecoration,
          ),
          suffixIcon: isVariable
              ? IconButton(
                  splashColor:
                      Theme.of(context).colorScheme.materialTransparent,
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    currentFocus.unfocus();
                    currentFocus.canRequestFocus = false;
                    isVisible = !isVisible;
                    Future.delayed(Duration(milliseconds: 100), () {
                      currentFocus.canRequestFocus = true;
                    });
                  },
                  icon: Icon(
                    isVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Theme.of(context)
                        .colorScheme
                        .authUserInputFieldIconDecoration,
                  ),
                )
              : null,
        ),
      ),
    ),
  );
}

Widget authForgotPassword(BuildContext context) {
  return GestureDetector(
    onTap: () {
      context.router.push(ForgotPasswordScreen());
    },
    child: Text(
      getTranslated(context, "authForgotPassword"),
      style: TextStyle(
        color: Theme.of(context).colorScheme.authForgotPassword,
        fontSize: Theme.of(context).textTheme.authForgotPassword,
        fontWeight: Theme.of(context).typography.authForgotPassword,
      ),
    ),
  );
}

Widget authPolicyAndTaC(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    child: Center(
        child: Text.rich(TextSpan(
            text: getTranslated(context, "authPolicyAndTaCPrimary") + " ",
            style: TextStyle(
              color: Theme.of(context).colorScheme.authPolicyAndTaC,
              fontSize: Theme.of(context).textTheme.authPolicyAndTaC,
              fontWeight: Theme.of(context).typography.authPolicyAndTaC,
            ),
            children: <TextSpan>[
          TextSpan(
              text: getTranslated(context, "authPolicyAndTaCPrivacy"),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.authPolicyAndTaC,
                  fontSize: Theme.of(context).textTheme.authPolicyAndTaC,
                  fontWeight: Theme.of(context).typography.authPolicyAndTaC,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  routeNavigation.routeTextViewer(context, getPolicyFilePath());
                }),
          TextSpan(
              text: "\n" +
                  getTranslated(context, "authPolicyAndTaCSeconday") +
                  " ",
              style: TextStyle(
                color: Theme.of(context).colorScheme.authPolicyAndTaC,
                fontSize: Theme.of(context).textTheme.authPolicyAndTaC,
                fontWeight: Theme.of(context).typography.authPolicyAndTaC,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: getTranslated(context, "authPolicyAndTaCConditions"),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.authPolicyAndTaC,
                        fontSize: Theme.of(context).textTheme.authPolicyAndTaC,
                        fontWeight:
                            Theme.of(context).typography.authPolicyAndTaC,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        routeNavigation.routeTextViewer(
                            context, getTaCFilePath());
                      })
              ])
        ]))),
  );
}

Widget authGetStarted(BuildContext context, bool isSignIn, State state) {
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
        color: Theme.of(context).colorScheme.materialTransparent,
        child: InkWell(
          splashColor: Theme.of(context).colorScheme.authGetStartedInkWell,
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onTap: () {
            authValidateSubmit(context, isSignIn, state);
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
  return RichText(
    text: TextSpan(
      text: getTranslated(context,
          isSignIn ? "authSwitchSignUpPrimary" : "authSwitchSignInPrimary"),
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
                  ? "authSwitchSignUpSecondary"
                  : "authSwitchSignInSecondary"),
          style: TextStyle(
            color: Theme.of(context).colorScheme.authSwitchSecondary,
            fontSize: Theme.of(context).textTheme.authSwitchSecondary,
            fontWeight: Theme.of(context).typography.authSwitchSecondary,
          ),
        ),
      ],
    ),
  );
}

void authValidateSubmit(
    BuildContext context, bool isSignIn, State state) async {
  formKey.currentState.save();
  if (isSignIn)
    firebaseAccounts
        .signInEmailAndPassword(context, userEmail, userPass)
        .then((value) {
      if (value) context.router.push(HomeScreen());
      firebaseAccounts.setCurrentUserProfilePicURL(state);
    });
  else
    firebaseAccounts
        .signUpEmailAndPassword(
            context, userEmail, userPass, userPassVerify, userName)
        .then((value) {
      if (value) context.router.push(HomeScreen());
      firebaseAccounts.setCurrentUserProfilePicURL(state);
    });
}
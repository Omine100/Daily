import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:daily/userInterface/home.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/utilities/designUtil/glassmorphism/glassmorphism.dart';
import 'package:daily/utilities/managementUtil/imageManagement.dart';

class WelcomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello",
          style: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "Easy Manage.",
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}

class WelcomeAccountAlready extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Already Have an Account? Sign In!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class WelcomeUserInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "SIGN UP!",
        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
      ),
    ).addWrapperGlass(
      borderRadius: 50,
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.55,
      shadowBlur: 80,
      shadowColor: Colors.grey.shade600,
      containerSpread: 16,
      backdropBlur: 8,
      colorOpacity: 0.3,
    );
  }
}

class WelcomeSocialIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 400, right: 400),
          child: Divider(
            color: Colors.white,
            thickness: 1.5,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () {}),
            SizedBox(
              width: 10,
            ),
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.twitter,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () {}),
            SizedBox(
              width: 10,
            ),
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ],
        ),
      ],
    );
  }
}

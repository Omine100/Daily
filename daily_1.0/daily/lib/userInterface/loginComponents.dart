import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:daily/userInterface/home.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/utilities/designUtil/glassmorphism/glassmorphism.dart';

class LoginTitle extends StatelessWidget {
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

class LoginUserInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Testing",
      style: TextStyle(color: Colors.white, fontSize: 20),
    ).addWrapperGlass(
      borderRadius: 16,
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.8,
      shadowBlur: 24,
      containerSpread: 16,
      backdropBlur: 10,
      colorOpacity: 0.13,
    );
  }
}

class LoginSocialIcons extends StatelessWidget {
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

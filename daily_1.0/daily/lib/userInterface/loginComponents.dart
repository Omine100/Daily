import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:daily/userInterface/home.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/utilities/designUtil/glassmorphism/glassmorphism.dart';

class loginUserInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      GestureDetector(
        onTap: () {
          RouteNavigation().routePage(context, HomeScreen());
        },
        child: Column(
          children: [
            SizedBox(
              height: 175,
            ),
            Center(
                child: Text(
              "Hello",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )).addWrapperGlass(
                borderRadius: 16,
                height: 100,
                width: 400,
                shadowBlur: 24,
                containerSpread: 16,
                backdropBlur: 10,
                colorOpacity: 0.13,
              ),
            SizedBox(
              height: 50,
            ),
            Center(
                child: Text(
              "Testing",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )).addWrapperGlass(
                borderRadius: 16,
                height: 300,
                width: 400,
                shadowBlur: 24,
                containerSpread: 16,
                backdropBlur: 10,
                colorOpacity: 0.13,
            ),
            SizedBox(
              height: 75,
            ),
            Padding(
              padding: EdgeInsets.only(left: 400, right: 400),
              child: Divider(
                  color: Colors.white,
                  thickness: 1.5,
                ),
            ),
            
          ]
        ),
      ),
    ],
  );
  }
}

class loginSocialIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.google, size: 40, color: Colors.white,), 
                  onPressed: () {}
                ),
                SizedBox(width: 10,),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.linkedin, size: 40, color: Colors.white,), 
                  onPressed: () {}
                ),
                SizedBox(width: 10,),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.twitter, size: 40, color: Colors.white,), 
                  onPressed: () {}
                ),
                SizedBox(width: 10,),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook, size: 40, color: Colors.white,), 
                  onPressed: () {}
                ),
              ],
            );
  }
}
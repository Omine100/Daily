import 'package:flutter/material.dart';
import 'package:daily/utilities/neumorphism/neumorphism.dart';
import 'package:daily/utilities/glassmorphism/glassmorphism.dart';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/assets/background.jpg"),
          fit: BoxFit.fill,
        )),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 250,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 24,
                    spreadRadius: 16,
                    color: Colors.black.withOpacity(0.2),
                  )
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20.0,
                      sigmaY: 20.0,
                    ),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white.withOpacity(0.2),
                          )),
                      child: Center(
                        child: Text("Testing",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Text("Testing").addWrapper(
            //   duration: const Duration(milliseconds: 100),
            //   borderRadius: 15,
            //   height: 100,
            //   width: 250,
            //   distance: 7,
            //   intensity: 0.2,
            //   blurRadius: 10,
            //   backgroundColor: Colors.grey.shade300,
            //   lightSource: NeumorphicLightSource.topLeft,
            //   shape: NeumorphicShape.convex,
            // ),
            // SizedBox(
            //   height: 50,
            // ),
            // Text("Testing").addWrapper(
            //   duration: const Duration(milliseconds: 100),
            //   borderRadius: 15,
            //   height: 350,
            //   width: 250,
            //   distance: 15,
            //   intensity: 0.2,
            //   blurRadius: 10,
            //   backgroundColor: Colors.grey.shade300,
            //   lightSource: NeumorphicLightSource.topLeft,
            //   shape: NeumorphicShape.emboss,
            // ),
          ],
        ),
      ),
    );
  }
}

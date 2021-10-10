import 'package:flutter/material.dart';
import 'package:daily/utilities/designUtil/neumorphism/neumorphism.dart';
import 'package:daily/utilities/designUtil/glassmorphism/glassmorphism.dart';
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
          // image: DecorationImage(
          //   image: AssetImage("lib/assets/background.jpg"),
          //   fit: BoxFit.fill,
          // )
          color: Colors.grey.shade300,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            // Center(
            //     child: Text(
            //   "Testing",
            //   style: TextStyle(color: Colors.white, fontSize: 20),
            // )).addWrapperGlass(
            //     borderRadius: 16,
            //     height: 200,
            //     width: 200,
            //     shadowBlur: 24,
            //     containerSpread: 16,
            //     backdropBlur: 10,
            //     colorOpacity: 0.13,
            //   ),
            Text("Testing").addWrapperNeu(
              duration: const Duration(milliseconds: 100),
              borderRadius: 15,
              height: 100,
              width: 250,
              distance: 7,
              intensity: 0.2,
              blurRadius: 10,
              backgroundColor: Colors.grey.shade300,
              lightSource: NeumorphicLightSource.topLeft,
              shape: NeumorphicShape.convex,
            ),
            SizedBox(
              height: 50,
            ),
            Text("Testing").addWrapperNeu(
              duration: const Duration(milliseconds: 100),
              borderRadius: 15,
              height: 350,
              width: 250,
              distance: 15,
              intensity: 0.2,
              blurRadius: 10,
              backgroundColor: Colors.grey.shade300,
              lightSource: NeumorphicLightSource.topLeft,
              shape: NeumorphicShape.emboss,
            ),
          ],
        ),
      ),
    );
  }
}

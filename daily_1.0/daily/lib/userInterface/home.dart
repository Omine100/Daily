import 'package:flutter/material.dart';
import 'package:daily/utilities/neumorphism/neumorphic.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.grey.shade300,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text("Testing").addWrapperNeu(
              duration: const Duration(milliseconds: 100),
              borderRadius: 15,
              height: 100,
              width: 250,
              distance: 7,
              intensity: 0.2,
              blurRadius: 10,
              backgroundColor: Colors.grey.shade300,
              lightSource: NeumorphicLightSources.topLeft,
              shape: NeumorphicShapes.convex,
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
              lightSource: NeumorphicLightSources.topLeft,
              shape: NeumorphicShapes.emboss,
            ),
          ],
        ),
      ),
    );
  }
}

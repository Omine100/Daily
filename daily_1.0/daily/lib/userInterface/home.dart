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
            Text("Home Slice"),
            SizedBox(
              height: 50,
            ),
            Text("Testing").addWrapper(
              duration: const Duration(milliseconds: 100),
              backgroundColor: Colors.grey.shade400,
              borderRadius: 10,
              height: 300,
              width: 200,
              distance: 5,
              intensity: 0.2,
              lightSource: NeumorphicLightSources.topLeft,
              shape: NeumorphicShapes.emboss,
              blurRadius: 10
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

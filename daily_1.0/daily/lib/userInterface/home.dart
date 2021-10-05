import 'package:flutter/material.dart';
import 'package:daily/standards/neumorphic/neumorphic.dart';

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
            Container(
              color: Colors.blue,
              height: 50,
              width: 300,
              child: RefreshIndicator(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                  ),
                  onRefresh: _refresh),
            ),
            SizedBox(
              height: 50,
            ),
            Text("Testing").addWrapper(
                borderRadius: 0,
                height: 150,
                width: 150,
                distance: 5,
                intensity: 0.3,
                blurRadius: 3,
                shape: NeumorphicShape.emboss,
                lightSource: NeumorphicLightSource.topLeft,
                backgroundColor: Colors.grey.shade300),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _refresh() {
  return Future.delayed(Duration(seconds: 5));
}

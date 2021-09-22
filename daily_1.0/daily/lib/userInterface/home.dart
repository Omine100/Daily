import 'package:flutter/material.dart';
import 'package:daily/standards/extensions/widgetNeumorphism.dart';

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
            Text("Home"),
            SizedBox(
              height: 50,
            ),
            Container(
              color: Colors.blue,
              height: 100,
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
            Text(
              "Testing\nTesting\nTesting",
              style: TextStyle(color: Colors.grey.shade500, fontSize: 50),
            ).addNeumorphism(boxColor: Color(0xFF0000), padding: 20)
          ],
        ),
      ),
    );
  }
}

Future<void> _refresh() {
  return Future.delayed(Duration(seconds: 5));
}

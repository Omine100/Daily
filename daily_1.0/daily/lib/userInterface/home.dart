import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade600,
      child: Column(
        children: [
          Text("Home"),
          Container(
            color: Colors.grey.shade400,
            height: 400,
            child: RefreshIndicator(
                child: ListView(
                  scrollDirection: Axis.vertical,
                ),
                onRefresh: _refresh),
          ),
        ],
      ),
    );
  }
}

Future<void> _refresh() {
  return Future.delayed(Duration(seconds: 5));
}

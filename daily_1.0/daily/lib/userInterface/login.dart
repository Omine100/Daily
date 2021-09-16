import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade600,
      child: Column(
        children: [
          Text("Login"),
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

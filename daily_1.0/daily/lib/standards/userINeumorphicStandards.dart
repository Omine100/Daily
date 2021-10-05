import 'package:flutter/material.dart';
import 'package:daily/utilities/neumorphism/neumorphic.dart';

//Need to figure out if we need this or not
extension neumorphic on Container {
  Container neuContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      color: Colors.green,
      child: this,
    );
  }
}

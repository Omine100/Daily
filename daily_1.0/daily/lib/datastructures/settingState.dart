import 'package:flutter/material.dart';

enum Format { DropDown, List, Switch, DateSelector, URL }

class Setting {
  String key;
  dynamic value;
  dynamic type;
  Format format;

  Setting(
      {@required this.key,
      @required this.value,
      @required this.type,
      @required this.format});
}

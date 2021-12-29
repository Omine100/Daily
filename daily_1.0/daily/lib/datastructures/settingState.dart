import 'package:flutter/material.dart';

enum Group { Account, General, Privacy, Hidden }
enum Format { DropDown, Switch, DateSelector, URL }

class Setting {
  String key;
  dynamic value;
  dynamic type;
  Group group;
  Format format;
  bool isSignInRequired;
  dynamic defaultValue;
  List<dynamic> items;

  Setting(
      {@required this.key,
      @required this.value,
      @required this.type,
      @required this.group,
      @required this.format,
      @required this.isSignInRequired,
      @required this.defaultValue,
      this.items});
}

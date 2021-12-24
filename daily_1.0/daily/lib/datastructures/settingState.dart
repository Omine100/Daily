import 'package:flutter/material.dart';

enum Group { Account, General, Privacy, Hidden }
enum Format { DropDown, List, Switch, DateSelector, URL }

class Setting {
  String key;
  dynamic value;
  dynamic type;
  Group group;
  Format format;
  dynamic defaultValue;
  List<dynamic> items;

  Setting(
      {@required this.key,
      @required this.value,
      @required this.type,
      @required this.group,
      @required this.format,
      @required this.defaultValue,
      this.items});
}

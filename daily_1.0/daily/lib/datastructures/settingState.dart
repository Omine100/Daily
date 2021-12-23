import 'package:flutter/material.dart';

enum Format { DropDown, List, Switch, DateSelector, URL }

enum Group { User, General, Privacy, Hidden }

class Setting {
  String key;
  dynamic value;
  dynamic type;
  Group group;
  Format format;
  dynamic defaultValue;

  Setting(
      {@required this.key,
      @required this.value,
      @required this.type,
      @required this.group,
      @required this.format,
      @required this.defaultValue});
}

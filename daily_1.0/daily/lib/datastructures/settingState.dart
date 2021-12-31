import 'package:flutter/material.dart';

enum Group { Account, General, Privacy, Hidden }
enum Format { DropDown, Switch, DateSelector, NoUserInput }

class Setting {
  String key;
  dynamic value;
  Group group;
  Format format;
  bool isSignInRequired;
  dynamic defaultValue;
  List<dynamic> items;
  Function onChanged;

  Setting(
      {@required this.key,
      @required this.value,
      @required this.group,
      @required this.format,
      @required this.isSignInRequired,
      @required this.defaultValue,
      this.items,
      this.onChanged});
}

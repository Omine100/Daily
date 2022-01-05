import 'package:flutter/material.dart';

enum Group {
  settingGroupAccount,
  settingGroupGeneral,
  settingGroupPrivacy,
  settingGroupHidden
}
enum Format { DropDown, Switch, DateSelector, Click, NoUserInput }

class Setting {
  String key;
  dynamic value;
  Group group;
  Format format;
  bool isSignInRequired;
  dynamic defaultValue;
  List<dynamic> items;
  Function onChanged;
  Function onClicked;

  Setting(
      {@required this.key,
      @required this.value,
      @required this.group,
      @required this.format,
      @required this.isSignInRequired,
      @required this.defaultValue,
      this.items,
      this.onChanged,
      this.onClicked});
}

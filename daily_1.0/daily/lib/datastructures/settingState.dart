import 'package:flutter/material.dart';

enum Group {
  settingGroupAccount,
  settingGroupGeneral,
  settingGroupPrivacy,
  settingGroupHidden
}
enum Format { DropDown, Switch, Click, NoUserInput }

class Setting {
  String key;
  Group group;
  Format format;
  bool isSignInRequired;
  dynamic value;
  dynamic defaultValue;
  Function items;
  Function onChanged;
  Function onClicked;
  Function call;

  Setting(
      {@required this.key,
      @required this.group,
      @required this.format,
      @required this.isSignInRequired,
      this.value,
      this.defaultValue,
      this.items,
      this.onChanged,
      this.onClicked,
      this.call});
}

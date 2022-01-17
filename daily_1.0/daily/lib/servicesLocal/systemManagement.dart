import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';

List<String> getThemeList() {
  return ["settingThemeLight", "settingThemeDark", "settingThemeDefault"];
}

List<DropdownMenuItem> getThemeDropdownMenuList(BuildContext context) {
  List<DropdownMenuItem> themeList = new List<DropdownMenuItem>();
  getThemeList().forEach((element) {
    themeList.add(new DropdownMenuItem(
        value: element,
        key: Key(element),
        child: Text(getTranslated(context, element))));
  });
  return themeList;
}

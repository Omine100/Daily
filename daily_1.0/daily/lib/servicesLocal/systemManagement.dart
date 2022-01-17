import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
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

void setTheme() {
  if (theme.value == "settingThemeDark" ||
      (theme.value == "settingThemeDefault" &&
          SchedulerBinding.instance.window.platformBrightness ==
              Brightness.dark)) isDark.value = true;
  isDark.value = false;
}

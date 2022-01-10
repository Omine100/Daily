import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';

List<DropdownMenuItem> getIsDarkDropdownMenuList() {
  Map<String, String> languagesMap = new Map<String, String>();

  List<DropdownMenuItem> isDarkList = new List<DropdownMenuItem>();
  isDarkList.add(new DropdownMenuItem(child: Text(getTranslated(context, key))))

  return languagesMap
      .map((language, flag) {
        return MapEntry(
            language,
            DropdownMenuItem<String>(
              value: "$language" + "_$language",
              key: Key(flag),
              child: Text(flag),
            ));
      })
      .values
      .toList();
}
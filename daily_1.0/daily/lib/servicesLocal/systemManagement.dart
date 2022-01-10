import 'package:flutter/material.dart';

List<DropdownMenuItem> getIsDarkDropdownMenuList() {
  Map<String, String> languagesMap = new Map<String, String>();
  getLanguageList().forEach((element) {
    languagesMap[element.language] = element.flag;
  });
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
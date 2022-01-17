import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/systemLocalizations.dart';
import 'package:daily/main.dart';

List<Languages> getLanguageList() {
  return <Languages>[
    Languages("Chinese", "zh"),
    Languages("English", "en"),
    Languages("Español", "es"),
    Languages("Finnish", "fi"),
    Languages("Français", "fr"),
    Languages("German", "de"),
    Languages("Italian", "it"),
    Languages("Japanese", "ja"),
    Languages("Polish", "pl"),
    Languages("Russian", "ru"),
  ];
}

List<DropdownMenuItem> getLocaleDropdownMenuList() {
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

class Languages {
  Languages(this.flag, this.language);

  final String flag;
  final String language;
}

void setLanguage(BuildContext context, String languageCode) async {
  Daily.setLocale(context, languageCode);
}

String getTranslated(BuildContext context, String key) {
  return AppLocalizations.of(context).translate(key);
}

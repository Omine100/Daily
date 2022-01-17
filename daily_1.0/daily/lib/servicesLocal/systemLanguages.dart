import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/systemLocalizations.dart';
import 'package:daily/main.dart';

List<Languages> getLanguageList() {
  return <Languages>[
    Languages("settingLocaleChinese", "zh"),
    Languages("settingLocaleEnglish", "en"),
    Languages("settingLocaleSpanish", "es"),
    Languages("settingLocaleFinnish", "fi"),
    Languages("settingLocaleFrench", "fr"),
    Languages("settingLocaleGerman", "de"),
    Languages("settingLocaleItalian", "it"),
    Languages("settingLocaleJapanese", "ja"),
    Languages("settingLocalePolish", "pl"),
    Languages("settingLocaleRussian", "ru"),
  ];
}

List<DropdownMenuItem> getLocaleDropdownMenuList(BuildContext context) {
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
              child: Text(getTranslated(context, flag)),
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

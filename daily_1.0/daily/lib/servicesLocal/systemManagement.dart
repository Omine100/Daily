import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/systemLocalizations.dart';
import 'package:daily/main.dart';

//Install extension '#region folding for VS Code'

// #region themes
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

void setTheme(BuildContext context, String value) {
  if (value == "settingThemeDark" ||
      (value == "settingThemeDefault" &&
          SchedulerBinding.instance.window.platformBrightness ==
              Brightness.dark)) {
    isDark.value = true;
    return;
  }
  isDark.value = false;
}
// #endregion

// #region legal
String getPolicyFilePath() {
  return "lib/legal/documents/privacyPolicy_01182022.txt";
}

String getTaCFilePath() {
  return "lib/legal/documents/termsAndConditions_01182022.txt";
}
// #endregion

// #region languages
class Languages {
  Languages(this.flag, this.language);

  final String flag;
  final String language;
}

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

void setLanguage(BuildContext context, String languageCode) async {
  Daily.setLocale(context, languageCode);
}

String getTranslated(BuildContext context, String key) {
  return AppLocalizations.of(context).translate(key);
}
// #endregion

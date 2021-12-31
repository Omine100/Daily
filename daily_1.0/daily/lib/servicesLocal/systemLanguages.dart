import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:daily/servicesLocal/systemLocalizations.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/main.dart';

List<Languages> getLanguageList() {
  return <Languages>[
    Languages(1, "🇺🇸", "English", "en"),
    Languages(2, "🇪🇸", "Español", "es"),
    Languages(3, "🇫🇷", "Français", "fr"),
  ];
}

List<DropdownMenuItem<String>> getDropdownMenuList() {
  List<String> languages = new List<String>();
  getLanguageList().forEach((element) {
    languages.add(element.language);
  });
  return languages.map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
}

class Languages {
  Languages(this.id, this.name, this.flag, this.language);

  //VARIABLE REFERENCE
  final int id;
  final String name;
  final String flag;
  final String language;
}

void setLanguage(BuildContext context, String newLanguageCode) async {
  languageCode.value = newLanguageCode;
  Locale _temp = await setLocale(newLanguageCode);
  Daily.setLocale(context, _temp);
}

Locale _locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case "en":
      _temp = Locale(languageCode, "en");
      break;
    case "es":
      _temp = Locale(languageCode, "es");
      break;
    case "fr":
      _temp = Locale(languageCode, "fr");
      break;
    default:
      _temp = Locale(languageCode, "en");
      break;
  }
  return _temp;
}

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString("LanguageCode", languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString("LanguageCode") ?? "en";
  return _locale(languageCode);
}

String getTranslated(BuildContext context, String key) {
  return AppLocalizations.of(context).translate(key);
}

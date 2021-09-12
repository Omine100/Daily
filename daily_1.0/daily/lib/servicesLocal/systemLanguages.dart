import 'package:flutter/material.dart';
import 'package:daily/main.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';
import 'package:daily/servicesLocal/systemLocalizations.dart';

class Languages {
  Languages(this.id, this.name, this.flag, this.languageCode);

  //VARIABLE REFERENCE
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  //MECHANICS
  static List<Languages> getLanguageList() {
    return <Languages>[
      Languages(1, "🇺🇸", "English", "en"),
      Languages(2, "🇪🇸", "Español", "es"),
      Languages(3, "🇫🇷", "Français", "fr"),
    ];
  }

  void setLanguage(BuildContext context, Languages language) async {
    Locale _temp = await SystemPreferences().saveToPrefs("LanguageCode", language.languageCode);
    Daily.setLocale(context, _temp);
  }
}

//MECHANICS
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

String getTranslated(BuildContext context, String key) {
  return AppLocalizations.of(context).translate(key);
}

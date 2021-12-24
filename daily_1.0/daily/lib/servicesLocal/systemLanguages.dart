import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/systemLocalizations.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';

List<Languages> getLanguageList() {
  return <Languages>[
    Languages(1, "🇺🇸", "English", "en"),
    Languages(2, "🇪🇸", "Español", "es"),
    Languages(3, "🇫🇷", "Français", "fr"),
  ];
}

class Languages {
  Languages(this.id, this.name, this.flag, this.language);

  //VARIABLE REFERENCE
  final int id;
  final String name;
  final String flag;
  final String language;

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

  void setLanguage(BuildContext context, Languages newLanguage) async {
    languageCode.value = newLanguage.language;
    locale.value = _locale(newLanguage.language);
  }
}

String getTranslated(BuildContext context, String key) {
  return AppLocalizations.of(context).translate(key);
}

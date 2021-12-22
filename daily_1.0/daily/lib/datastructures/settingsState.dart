import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';

class SettingsState {
  final String imageURL;
  final String languageCode;
  final bool isDark;
  final bool isAndroid;

  SettingsState(this.imageURL, this.languageCode, this.isDark, this.isAndroid);

  SettingsState.fromJson(Map<String, dynamic> json)
      : imageURL = json['imageURL'],
        languageCode = json['languageCode'],
        isDark = json['isDark'],
        isAndroid = json['isAndroid'];

  Map<String, dynamic> toJson() => {
        'imageURL': imageURL,
        'languageCode': languageCode,
        'isDark': isDark,
        'isAndroid': isAndroid,
      };

  jsonToPrefs(Map<String, dynamic> json) async {
    json.forEach((key, value) {
      SystemPreferences().saveToPrefs(key, value);
    });
  }
}

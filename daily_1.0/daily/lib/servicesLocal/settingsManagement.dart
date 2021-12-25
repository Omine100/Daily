import 'package:shared_preferences/shared_preferences.dart';
import 'package:daily/datastructures/settingState.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';

SharedPreferences prefs;
prefsInstance() async {
  prefs ??= await SharedPreferences.getInstance();
}

void settingsToPrefs(List<Setting> settingsList) async {
  await prefsInstance();
  settingsList.forEach((setting) {
    saveToPrefs(setting.key, setting.value);
  });
}

Future<void> prefsToSettings() async {
  await prefsInstance();
  if (prefs == null) {
    settingsList.forEach((setting) {
      saveToPrefs(setting.key, setting.defaultValue);
    });
  }
  prefs.getKeys().forEach((key) {
    if (settingsList.contains(key)) //Might need to change this
      settingsList.where((element) => element.key == key).first.value =
          prefs.get(key);
  });
}

saveToPrefs(String key, dynamic value) {
  switch (value.runtimeType) {
    case int:
      prefs.setInt(key, value);
      break;
    case double:
      prefs.setDouble(key, value);
      break;
    case bool:
      prefs.setBool(key, value);
      break;
    case String:
      prefs.setString(key, value);
      break;
    default:
      prefs.setString(key, value.toString());
  }
}

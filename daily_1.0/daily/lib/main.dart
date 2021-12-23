import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/servicesLocal/systemLocalizations.dart';
import 'package:daily/servicesLocal/systemPreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new Daily());
}

class Daily extends StatefulWidget {
  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  //CLASS INITIALIZATION
  FirebaseAccounts firebaseAccounts = new FirebaseAccounts();
  RouteNavigation routeNavigation = new RouteNavigation();
  SystemPreferences systemPreferences = new SystemPreferences();

  //VARIABLE INITIALIZATION
  bool isSignedIn = false;

  //MECHANICS
  void initState() {
    super.initState();
    firebaseAccounts.getSignedInStatus().then((_isSignedIn) => isSignedIn);
    systemSetup();
  }

  void systemSetup() {
    systemPreferences.saveToPrefs('isAndroid',
        Theme.of(context).platform == TargetPlatform.android ? true : false);
    systemPreferences.getFromPrefs('isDark').then((_isDark) =>
        _isDark == null ? isDark.value = false : isDark.value = _isDark);
    systemPreferences.getFromPrefs('languageCode').then((_languageCode) => {
          _languageCode == null
              ? languageCode.value = "en"
              : languageCode.value = _languageCode
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daily",
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: routeNavigation.routeInitial(context, isSignedIn),
      locale: locale,
      supportedLocales: [Locale('en'), Locale('es'), Locale('fr')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}

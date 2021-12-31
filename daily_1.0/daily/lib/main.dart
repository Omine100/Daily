import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/servicesLocal/systemLocalizations.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new Daily());
}

class Daily extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _DailyState state = context.findAncestorStateOfType<_DailyState>();
    state.setLocale(locale);
  }

  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  //CLASS INITIALIZATION
  FirebaseAccounts firebaseAccounts = new FirebaseAccounts();
  RouteNavigation routeNavigation = new RouteNavigation();

  //VARIABLE INITIALIZATION
  Locale stateLocale;
  bool isSignedIn = false;

  void initState() {
    super.initState();
    prefsToSettings();
    isSignedIn = firebaseAccounts.getSignedInStatus();
  }

  void setLocale(Locale _locale) {
    setState(() {
      stateLocale = _locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daily",
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: routeNavigation.routeInitial(context, isSignedIn),
      locale: locale.value != null
          ? locale.value.runtimeType == Locale
              ? locale.value
              : Locale(
                  locale.value.split("_").first, locale.value.split("_").last)
          : locale.defaultValue,
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

import 'package:daily/servicesLocal/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/systemLocalizations.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';
import 'package:daily/themesLocal/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await prefsToSettings();
  runApp(new Daily());
}

class Daily extends StatefulWidget {
  static void setLocale(BuildContext context, String languageCode) {
    _DailyState state = context.findAncestorStateOfType<_DailyState>();
    state.setLocale(languageCode);
  }

  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  FirebaseAccounts firebaseAccounts = new FirebaseAccounts();
  RouteNavigation routeNavigation = new RouteNavigation();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    setTheme(context);
    var window = WidgetsBinding.instance.window;
    window.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance?.handlePlatformBrightnessChanged();
      setTheme(context);
    };
  }

  void setLocale(String languageCode) {
    setState(() {
      locale.value = languageCode;
    });
  }

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: "Daily",
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      locale: locale.value != null
          ? Locale(locale.value.split("_").first, locale.value.split("_").last)
          : locale.defaultValue,
      theme: materialThemeData(),
      supportedLocales: [
        Locale('zh'),
        Locale('en'),
        Locale('es'),
        Locale('fi'),
        Locale('fr'),
        Locale('de'),
        Locale('it'),
        Locale('ja'),
        Locale('pl'),
        Locale('ru'),
      ],
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

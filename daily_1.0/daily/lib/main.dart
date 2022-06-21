import 'package:daily/firebase_options.dart';
import 'package:daily/themesLocal/themeData/themeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/customScrollBehavior.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/systemLocalizations.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:daily/servicesLocal/settingsManagement.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    Firebase.app();
  }
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
    setColorSchemeExtension(context);
    setTextThemeExtension(context);

    return MaterialApp.router(
      scrollBehavior: CustomScrollBehavior(),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: "Daily",
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      locale: locale.value != null
          ? Locale(locale.value.split("_").first, locale.value.split("_").last)
          : locale.defaultValue,
      theme: lightThemeDataExtension,
      darkTheme: darkThemeDataExtension,
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => {runApp(new Daily())});
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
  @override
  Widget build(BuildContext context) {}
}

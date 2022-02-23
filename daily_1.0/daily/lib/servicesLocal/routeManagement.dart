import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/userInterface/auth.dart';
import 'package:daily/userInterface/forgotPassword.dart';
import 'package:daily/userInterface/home.dart';
import 'package:daily/userInterface/imageViewer.dart';
import 'package:daily/userInterface/textViewer.dart';
import 'package:daily/userInterface/welcome.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: WelcomeScreen, initial: true),
    AutoRoute(page: AuthScreen, name: "/auth"),
    AutoRoute(page: ForgotPasswordScreen),
    AutoRoute(page: HomeScreen),
    AutoRoute(page: ImageViewerScreen),
    AutoRoute(page: TextViewerScreen),
  ],
)
class $AppRouter {}

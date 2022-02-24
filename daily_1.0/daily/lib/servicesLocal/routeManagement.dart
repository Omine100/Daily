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
    AutoRoute(page: WelcomeScreen, path: "welcome", initial: true),
    AutoRoute(page: AuthScreen, path: "auth"),
    AutoRoute(page: ForgotPasswordScreen, path: "forgot-password"),
    AutoRoute(page: HomeScreen, path: "home"),
    AutoRoute(page: ImageViewerScreen, path: "image-viewer"),
    AutoRoute(page: TextViewerScreen, path: "text-viewer"),
  ],
)
class $AppRouter {}

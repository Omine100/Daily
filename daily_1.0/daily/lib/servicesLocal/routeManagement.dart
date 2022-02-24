import 'package:auto_route/auto_route.dart';
import 'package:daily/userInterface/welcome/welcome.dart';
import 'package:daily/userInterface/auth/auth.dart';
import 'package:daily/userInterface/forgotPassword/forgotPassword.dart';
import 'package:daily/userInterface/home/home.dart';
import 'package:daily/userInterface/imageViewer/imageViewer.dart';
import 'package:daily/userInterface/textViewer/textViewer.dart';

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

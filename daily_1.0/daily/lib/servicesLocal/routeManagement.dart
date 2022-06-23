import 'package:auto_route/auto_route.dart';
import 'package:daily/userInterface/error/error.dart';
import 'package:daily/userInterface/auth/auth.dart';
import 'package:daily/userInterface/forgotPassword/forgotPassword.dart';
import 'package:daily/userInterface/base/base.dart';
import 'package:daily/userInterface/imageViewer/imageViewer.dart';
import 'package:daily/userInterface/textViewer/textViewer.dart';
import 'package:daily/userInterface/verify/verify.dart';

//flutter packages pub run build_runner build

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: AuthScreen, path: "auth", initial: true),
    AutoRoute(page: VerifyScreen, path: "verify"),
    AutoRoute(page: ForgotPasswordScreen, path: "forgot-password"),
    AutoRoute(page: BaseScreen, path: "base"),
    AutoRoute(page: ImageViewerScreen, path: "image-viewer"),
    AutoRoute(page: TextViewerScreen, path: "text-viewer"),
    AutoRoute(page: ErrorScreen, path: '*'),
  ],
)
class $AppRouter {}

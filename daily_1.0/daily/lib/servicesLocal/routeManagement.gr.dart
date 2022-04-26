// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../userInterface/auth/auth.dart' as _i1;
import '../userInterface/error/error.dart' as _i7;
import '../userInterface/forgotPassword/forgotPassword.dart' as _i3;
import '../userInterface/home/home.dart' as _i4;
import '../userInterface/imageViewer/imageViewer.dart' as _i5;
import '../userInterface/textViewer/textViewer.dart' as _i6;
import '../userInterface/verify/verify.dart' as _i2;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState> navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AuthScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.AuthScreen());
    },
    VerifyScreen.name: (routeData) {
      final args = routeData.argsAs<VerifyScreenArgs>(
          orElse: () => const VerifyScreenArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.VerifyScreen(email: args.email, pass: args.pass));
    },
    ForgotPasswordScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.ForgotPasswordScreen());
    },
    HomeScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.HomeScreen());
    },
    ImageViewerScreen.name: (routeData) {
      final args = routeData.argsAs<ImageViewerScreenArgs>(
          orElse: () => const ImageViewerScreenArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ImageViewerScreen(
              image: args.image, imagePath: args.imagePath));
    },
    TextViewerScreen.name: (routeData) {
      final args = routeData.argsAs<TextViewerScreenArgs>(
          orElse: () => const TextViewerScreenArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.TextViewerScreen(filePath: args.filePath));
    },
    ErrorScreen.name: (routeData) {
      final args = routeData.argsAs<ErrorScreenArgs>(
          orElse: () => const ErrorScreenArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.ErrorScreen(filePath: args.filePath));
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig('/#redirect',
            path: '/', redirectTo: 'auth', fullMatch: true),
        _i8.RouteConfig(AuthScreen.name, path: 'auth'),
        _i8.RouteConfig(VerifyScreen.name, path: 'verify'),
        _i8.RouteConfig(ForgotPasswordScreen.name, path: 'forgot-password'),
        _i8.RouteConfig(HomeScreen.name, path: 'home'),
        _i8.RouteConfig(ImageViewerScreen.name, path: 'image-viewer'),
        _i8.RouteConfig(TextViewerScreen.name, path: 'text-viewer'),
        _i8.RouteConfig(ErrorScreen.name, path: '*')
      ];
}

/// generated route for
/// [_i1.AuthScreen]
class AuthScreen extends _i8.PageRouteInfo<void> {
  const AuthScreen() : super(AuthScreen.name, path: 'auth');

  static const String name = 'AuthScreen';
}

/// generated route for
/// [_i2.VerifyScreen]
class VerifyScreen extends _i8.PageRouteInfo<VerifyScreenArgs> {
  VerifyScreen({String email, String pass})
      : super(VerifyScreen.name,
            path: 'verify', args: VerifyScreenArgs(email: email, pass: pass));

  static const String name = 'VerifyScreen';
}

class VerifyScreenArgs {
  const VerifyScreenArgs({this.email, this.pass});

  final String email;

  final String pass;

  @override
  String toString() {
    return 'VerifyScreenArgs{email: $email, pass: $pass}';
  }
}

/// generated route for
/// [_i3.ForgotPasswordScreen]
class ForgotPasswordScreen extends _i8.PageRouteInfo<void> {
  const ForgotPasswordScreen()
      : super(ForgotPasswordScreen.name, path: 'forgot-password');

  static const String name = 'ForgotPasswordScreen';
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreen extends _i8.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: 'home');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i5.ImageViewerScreen]
class ImageViewerScreen extends _i8.PageRouteInfo<ImageViewerScreenArgs> {
  ImageViewerScreen({_i9.Widget image, String imagePath})
      : super(ImageViewerScreen.name,
            path: 'image-viewer',
            args: ImageViewerScreenArgs(image: image, imagePath: imagePath));

  static const String name = 'ImageViewerScreen';
}

class ImageViewerScreenArgs {
  const ImageViewerScreenArgs({this.image, this.imagePath});

  final _i9.Widget image;

  final String imagePath;

  @override
  String toString() {
    return 'ImageViewerScreenArgs{image: $image, imagePath: $imagePath}';
  }
}

/// generated route for
/// [_i6.TextViewerScreen]
class TextViewerScreen extends _i8.PageRouteInfo<TextViewerScreenArgs> {
  TextViewerScreen({String filePath})
      : super(TextViewerScreen.name,
            path: 'text-viewer',
            args: TextViewerScreenArgs(filePath: filePath));

  static const String name = 'TextViewerScreen';
}

class TextViewerScreenArgs {
  const TextViewerScreenArgs({this.filePath});

  final String filePath;

  @override
  String toString() {
    return 'TextViewerScreenArgs{filePath: $filePath}';
  }
}

/// generated route for
/// [_i7.ErrorScreen]
class ErrorScreen extends _i8.PageRouteInfo<ErrorScreenArgs> {
  ErrorScreen({String filePath})
      : super(ErrorScreen.name,
            path: '*', args: ErrorScreenArgs(filePath: filePath));

  static const String name = 'ErrorScreen';
}

class ErrorScreenArgs {
  const ErrorScreenArgs({this.filePath});

  final String filePath;

  @override
  String toString() {
    return 'ErrorScreenArgs{filePath: $filePath}';
  }
}

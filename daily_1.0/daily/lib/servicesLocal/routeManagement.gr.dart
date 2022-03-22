// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../userInterface/auth/auth.dart' as _i1;
import '../userInterface/error/error.dart' as _i6;
import '../userInterface/forgotPassword/forgotPassword.dart' as _i2;
import '../userInterface/home/home.dart' as _i3;
import '../userInterface/imageViewer/imageViewer.dart' as _i4;
import '../userInterface/textViewer/textViewer.dart' as _i5;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState> navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AuthScreen.name: (routeData) {
      final args = routeData.argsAs<AuthScreenArgs>(
          orElse: () => const AuthScreenArgs());
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.AuthScreen(isSignIn: args.isSignIn));
    },
    ForgotPasswordScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.ForgotPasswordScreen());
    },
    HomeScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.HomeScreen());
    },
    ImageViewerScreen.name: (routeData) {
      final args = routeData.argsAs<ImageViewerScreenArgs>(
          orElse: () => const ImageViewerScreenArgs());
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ImageViewerScreen(
              image: args.image, imagePath: args.imagePath));
    },
    TextViewerScreen.name: (routeData) {
      final args = routeData.argsAs<TextViewerScreenArgs>(
          orElse: () => const TextViewerScreenArgs());
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.TextViewerScreen(filePath: args.filePath));
    },
    ErrorScreen.name: (routeData) {
      final args = routeData.argsAs<ErrorScreenArgs>(
          orElse: () => const ErrorScreenArgs());
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.ErrorScreen(filePath: args.filePath));
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig('/#redirect',
            path: '/', redirectTo: 'auth', fullMatch: true),
        _i7.RouteConfig(AuthScreen.name, path: 'auth'),
        _i7.RouteConfig(ForgotPasswordScreen.name, path: 'forgot-password'),
        _i7.RouteConfig(HomeScreen.name, path: 'home'),
        _i7.RouteConfig(ImageViewerScreen.name, path: 'image-viewer'),
        _i7.RouteConfig(TextViewerScreen.name, path: 'text-viewer'),
        _i7.RouteConfig(ErrorScreen.name, path: '*')
      ];
}

/// generated route for
/// [_i1.AuthScreen]
class AuthScreen extends _i7.PageRouteInfo<AuthScreenArgs> {
  AuthScreen({bool isSignIn})
      : super(AuthScreen.name,
            path: 'auth', args: AuthScreenArgs(isSignIn: isSignIn));

  static const String name = 'AuthScreen';
}

class AuthScreenArgs {
  const AuthScreenArgs({this.isSignIn});

  final bool isSignIn;

  @override
  String toString() {
    return 'AuthScreenArgs{isSignIn: $isSignIn}';
  }
}

/// generated route for
/// [_i2.ForgotPasswordScreen]
class ForgotPasswordScreen extends _i7.PageRouteInfo<void> {
  const ForgotPasswordScreen()
      : super(ForgotPasswordScreen.name, path: 'forgot-password');

  static const String name = 'ForgotPasswordScreen';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreen extends _i7.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: 'home');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i4.ImageViewerScreen]
class ImageViewerScreen extends _i7.PageRouteInfo<ImageViewerScreenArgs> {
  ImageViewerScreen({_i8.Widget image, String imagePath})
      : super(ImageViewerScreen.name,
            path: 'image-viewer',
            args: ImageViewerScreenArgs(image: image, imagePath: imagePath));

  static const String name = 'ImageViewerScreen';
}

class ImageViewerScreenArgs {
  const ImageViewerScreenArgs({this.image, this.imagePath});

  final _i8.Widget image;

  final String imagePath;

  @override
  String toString() {
    return 'ImageViewerScreenArgs{image: $image, imagePath: $imagePath}';
  }
}

/// generated route for
/// [_i5.TextViewerScreen]
class TextViewerScreen extends _i7.PageRouteInfo<TextViewerScreenArgs> {
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
/// [_i6.ErrorScreen]
class ErrorScreen extends _i7.PageRouteInfo<ErrorScreenArgs> {
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

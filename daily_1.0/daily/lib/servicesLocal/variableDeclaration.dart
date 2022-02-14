import 'package:camera/camera.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';

RouteNavigation routeNavigation = new RouteNavigation();
List<CameraDescription> cameras;
CameraController controller;
CameraDescription description;
bool showFocusCircle = false;
FlashMode flashMode = FlashMode.off;
double zoomLevel = 1.0;
double focusX = 0, focusY = 0;
double scale = 0;

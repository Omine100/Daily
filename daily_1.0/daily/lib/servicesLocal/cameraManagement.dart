import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

List<CameraDescription> cameras;
CameraController controller;
CameraDescription description;
bool showFocusCircle = false;
FlashMode flashMode = FlashMode.off;
double zoomLevel = 1.0;
double focusX = 0, focusY = 0;
double scale = 0;

void setupCamera(State state) async {
  cameras = await availableCameras();
  try {
    controller = CameraController(
      description == null ? cameras[1] : description,
      ResolutionPreset.max,
    );
    await controller.initialize();
  } on CameraException catch (_) {
    // do something on error.
  }
  state.setState(() {});
}

void controllerDispose() {
  controller.dispose();
}

switchCamera(State state) {
  final lensDirection = controller.description.lensDirection;
  if (lensDirection == CameraLensDirection.back) {
    description = cameras.firstWhere((description) =>
        description.lensDirection == CameraLensDirection.front);
  } else {
    description = cameras.firstWhere(
        (description) => description.lensDirection == CameraLensDirection.back);
  }

  setupCamera(state);
}

switchFlash(State state) async {
  state.setState(() {
    flashMode == FlashMode.off
        ? flashMode = FlashMode.always
        : flashMode = FlashMode.off;
  });
  await controller.setFlashMode(flashMode);
}

zoom(BuildContext context, State state, ScaleStartDetails details) async {
  zoomLevel = scale;
}

zoomUpdate(
    BuildContext context, State state, ScaleUpdateDetails details) async {
  scale = zoomLevel * details.scale;
  if (scale < 1) scale = 1;
  if (scale > 8) scale = 8;
  controller.setZoomLevel(scale);
}

Future<void> focus(
    BuildContext context, State state, TapUpDetails details) async {
  if (controller.value.isInitialized) {
    showFocusCircle = true;
    focusX = details.localPosition.dx;
    focusY = details.localPosition.dy;

    double fullWidth = MediaQuery.of(context).size.width;
    double cameraHeight = fullWidth * controller.value.aspectRatio;

    double xp = focusX / fullWidth;
    double yp = focusX / cameraHeight;

    Offset point = Offset(xp, yp);
    await controller.setFocusPoint(point);

    state.setState(() {
      Future.delayed(const Duration(milliseconds: 500)).whenComplete(() {
        state.setState(() {
          showFocusCircle = false;
        });
      });
    });
  }
}

Future<XFile> takePicture(State state) async {
  try {
    XFile file = await controller.takePicture();
    state.setState(() {});
    return file;
  } on CameraException catch (e) {
    print('Error occured while taking picture: $e');
    return null;
  }
}

Future<Widget> imageProcess(BuildContext context, XFile rawFile) async {
  img.Image image = img.decodeImage(File(rawFile.path).readAsBytesSync());
  if (controller.description.lensDirection == CameraLensDirection.front)
    image = img.flipHorizontal(image);

  Image newImage = new Image.memory(
    img.encodeJpg(image),
    fit: BoxFit.fill,
    alignment: Alignment.center,
  );

  return Transform.scale(scale: scale, child: newImage);
}

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:daily/servicesLocal/variableDeclaration.dart';

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

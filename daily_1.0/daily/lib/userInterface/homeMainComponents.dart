import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:daily/themesLocal/colors.dart';
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
  flashMode == FlashMode.off
      ? await controller.setFlashMode(FlashMode.off)
      : await controller.setFlashMode(FlashMode.always);
  state.setState(() {
    flashMode == FlashMode.off
        ? flashMode = FlashMode.always
        : flashMode = FlashMode.off;
  });
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

Future<XFile> takePicture() async {
  final CameraController cameraController = controller;
  if (cameraController.value.isTakingPicture) {
    return null;
  }
  try {
    XFile file = await cameraController.takePicture();
    return file;
  } on CameraException catch (e) {
    print('Error occured while taking picture: $e');
    return null;
  }
}

Widget mainCamera(BuildContext context, State state) {
  final size = MediaQuery.of(context).size;
  if (controller == null || !controller.value.isInitialized) {
    return Container(
        decoration: BoxDecoration(color: Colors.black),
        width: size.width,
        height: size.height,
        child: Center(
            child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ))));
  }

  scale = size.aspectRatio * controller.value.aspectRatio;
  if (scale < 1) scale = 1 / scale;

  return GestureDetector(
    onTapUp: (details) {
      focus(context, state, details);
    },
    onScaleStart: (details) {
      zoom(context, state, details);
    },
    onScaleUpdate: (details) {
      zoomUpdate(context, state, details);
    },
    child: Transform.scale(
      scale: scale,
      child: Center(
        child: CameraPreview(controller),
      ),
    ),
  );
}

Widget mainFocusCircle(BuildContext context) {
  return showFocusCircle
      ? Positioned(
          top: focusY - 20,
          left: focusX - 20,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2)),
          ),
        )
      : Container();
}

Widget mainCameraComponentCard(BuildContext context, State state) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.mainCard,
      borderRadius: BorderRadius.circular(45),
    ),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: mainSwitchCameraButton(context, state),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: mainSwitchFlashButton(context, state),
        ),
      ],
    ),
  );
}

Widget mainSwitchCameraButton(BuildContext context, State state) {
  return IconButton(
      onPressed: () {
        switchCamera(state);
      },
      icon: Icon(
        Icons.flip_camera_android,
        size: 35,
        color: Theme.of(context).colorScheme.homeNavigationBarSelectedIcon,
      ));
}

Widget mainSwitchFlashButton(BuildContext context, State state) {
  return IconButton(
      onPressed: () {
        switchFlash(state);
      },
      icon: Icon(
        flashMode == FlashMode.off ? Icons.flash_on : Icons.flash_off,
        size: 35,
        color: Theme.of(context).colorScheme.homeNavigationBarSelectedIcon,
      ));
}

Widget mainPictureButton(BuildContext context) {
  return InkWell(
    onTap: () async {
      XFile rawImage = await takePicture();
      File imageFile = File(rawImage.path);
      routeNavigation.routeImageViewer(context, imageFile.path, scale);
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.circle, color: Colors.white38, size: 80),
        Icon(Icons.circle, color: Colors.white, size: 65),
      ],
    ),
  );
}

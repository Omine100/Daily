import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:daily/themesLocal/colors.dart';

List<CameraDescription> cameras;
CameraController controller;
CameraDescription description;
bool isReady = false;
bool showFocusCircle = false;
double x = 0, y = 0;

void setupCamera(State state) async {
  cameras = await availableCameras();
  try {
    controller = CameraController(
      description == null ? cameras[0] : description,
      ResolutionPreset.max,
    );
    await controller.initialize();
  } on CameraException catch (_) {
    // do something on error.
  }
  if (!state.mounted) return;
  state.setState(() {
    isReady = true;
  });
}

switchCamera(State state) {
  final lensDirection = controller.description.lensDirection;
  if (lensDirection == CameraLensDirection.front) {
    description = cameras.firstWhere(
        (description) => description.lensDirection == CameraLensDirection.back);
  } else {
    description = cameras.firstWhere((description) =>
        description.lensDirection == CameraLensDirection.front);
  }

  setupCamera(state);
}

Future<void> _onTap(
    BuildContext context, State state, TapUpDetails details) async {
  if (controller.value.isInitialized) {
    showFocusCircle = true;
    x = details.localPosition.dx;
    y = details.localPosition.dy;

    double fullWidth = MediaQuery.of(context).size.width;
    double cameraHeight = fullWidth * controller.value.aspectRatio;

    double xp = x / fullWidth;
    double yp = y / cameraHeight;

    Offset point = Offset(xp, yp);
    await controller.setFocusPoint(point);

    state.setState(() {
      Future.delayed(const Duration(milliseconds: 750)).whenComplete(() {
        state.setState(() {
          showFocusCircle = false;
        });
      });
    });
  }
}

Widget mainFocusCircle(BuildContext context) {
  return showFocusCircle
      ? Positioned(
          top: y - 20,
          left: x - 20,
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

Widget cameraPreview(BuildContext context) {
  return AspectRatio(
      aspectRatio: MediaQuery.of(context).size.width /
          MediaQuery.of(context).size.height,
      child: CameraPreview(controller));
}

Widget mainCamera(BuildContext context, State state) {
  var size = MediaQuery.of(context).size;
  if (isReady == false ||
      controller == null ||
      !controller.value.isInitialized) {
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
              ))),
    );
  }

  return GestureDetector(
    onTapUp: (details) {
      _onTap(context, state, details);
    },
    child: Container(
      width: size.width,
      height: size.height,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          child: cameraPreview(context)),
    ),
  );
}

Widget mainSwitchCamera(BuildContext context, State state) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Theme.of(context).colorScheme.homeNavigationBarBackground,
    ),
    child: IconButton(
        onPressed: () {
          switchCamera(state);
        },
        icon: Icon(
          Icons.flip_camera_android,
          size: 35,
          color: Theme.of(context).colorScheme.homeNavigationBarSelectedIcon,
        )),
  );
}

Widget mainPictureButton(BuildContext context) {
  XFile imageFile;
  return GestureDetector(
    onTap: () async {
      imageFile = await controller.takePicture();
      routeNavigation.routeImageViewer(
          context, imageFile.path, controller.value.aspectRatio);
    },
    child: Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.transparent,
          border: Border.all(width: 6, color: Colors.white)),
      child: Container(),
    ),
  );
}

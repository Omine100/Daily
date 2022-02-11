import 'package:daily/servicesLocal/settingsDeclaration.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:daily/themesLocal/colors.dart';

List<CameraDescription> cameras;
CameraController controller;
CameraDescription description;
bool isReady = false;

void setupCamera(State state) async {
  cameras = await availableCameras();
  try {
    controller = CameraController(
      description == null ? cameras[0] : description,
      ResolutionPreset.ultraHigh,
    );
    controller.setFocusMode(FocusMode.auto);

    await controller.initialize();
  } on CameraException catch (_) {
    // do something on error.
  }
  if (!state.mounted) return;
  state.setState(() {
    isReady = true;
  });
}

void disposeCamera() {
  controller.dispose();
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

Widget cameraPreview(BuildContext context) {
  return AspectRatio(
      aspectRatio: MediaQuery.of(context).size.width /
          MediaQuery.of(context).size.height,
      child: CameraPreview(controller));
}

Widget mainCamera(BuildContext context) {
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

  return Container(
    width: size.width,
    height: size.height,
    child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        child: cameraPreview(context)),
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
  return Container(
    height: 75,
    width: 75,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.transparent,
        border: Border.all(width: 6, color: Colors.white)),
    child: GestureDetector(
      onTap: () async {
        imageFile = await controller.takePicture();
        routeNavigation.routeImageViewer(
            context, imageFile.path, controller.value.aspectRatio);
      },
      child: Container(),
    ),
  );
}

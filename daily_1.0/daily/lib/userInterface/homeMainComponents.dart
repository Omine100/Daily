import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/imageViewer.dart';

List<CameraDescription> _cameras;
CameraController _controller;
CameraDescription _description;
bool _isReady = false;

void setupCamera(State state) async {
  _cameras = await availableCameras();
  try {
    _controller = CameraController(
      _description == null ? _cameras[0] : _description,
      ResolutionPreset.ultraHigh,
    );
    _controller.setFocusMode(FocusMode.auto);

    await _controller.initialize();
  } on CameraException catch (_) {
    // do something on error.
  }
  if (!state.mounted) return;
  state.setState(() {
    _isReady = true;
  });
}

void disposeCamera() {
  _controller.dispose();
}

switchCamera(State state) {
  final lensDirection = _controller.description.lensDirection;
  if (lensDirection == CameraLensDirection.front) {
    _description = _cameras.firstWhere(
        (description) => description.lensDirection == CameraLensDirection.back);
  } else {
    _description = _cameras.firstWhere((description) =>
        description.lensDirection == CameraLensDirection.front);
  }

  setupCamera(state);
}

Widget cameraPreview(BuildContext context) {
  return AspectRatio(
      aspectRatio: MediaQuery.of(context).size.width /
          MediaQuery.of(context).size.height,
      child: CameraPreview(_controller));
}

Widget homeMainCamera(BuildContext context) {
  var size = MediaQuery.of(context).size;
  if (_isReady == false ||
      _controller == null ||
      !_controller.value.isInitialized) {
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

Widget homeMainSwitchCamera(BuildContext context, State state) {
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

Widget homeMainPictureButton(BuildContext context) {
  XFile imageFile;

  return Container(
    height: 75,
    width: 75,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.transparent,
        border: Border.all(width: 6, color: Colors.white)),
    child: IconButton(
        onPressed: () async {
          imageFile = await _controller.takePicture();

          //Need to change to routeNavigation
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ImageViewerScreen(
                filePath: imageFile.path,
                aspectRatio: _controller.value.aspectRatio,
              ),
            ),
          );
        },
        icon: Icon(
          Icons.camera_alt_outlined,
          size: 45,
          color: Colors.white,
        )),
  );
}

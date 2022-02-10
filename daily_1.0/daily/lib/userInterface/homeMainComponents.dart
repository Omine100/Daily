import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

List<CameraDescription> _cameras;
CameraController _controller;
bool _isReady = false;
State states;

void setupCamera(State state) async {
  states = state;
  try {
    _cameras = await availableCameras();
    _controller = CameraController(
      _cameras[0],
      ResolutionPreset.low,
    );

    await _controller.initialize();
  } on CameraException catch (_) {
    // do something on error.
  }
  state.setState(() {
    _isReady = true;
  });
}

void disposeCamera() {
  _controller.dispose();
}

switchCamera() {
  states.setState(() {
    _controller = CameraController(
      _controller.description == _cameras[0] ? _cameras[1] : _cameras[0],
      ResolutionPreset.low,
    );
  });
}

Widget cameraPreview(BuildContext context) {
  return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
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

Widget homeSwitchCamera(BuildContext context) {
  return IconButton(
      onPressed: () {
        switchCamera();
      },
      icon: Icon(Icons.flip_camera_android));
}

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:daily/servicesLocal/cameraManagement.dart';
import 'package:daily/servicesLocal/imageManagement.dart';
import 'package:daily/servicesLocal/variableDeclaration.dart';
import 'package:daily/themesLocal/colors.dart';

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
    onDoubleTap: () {
      switchCamera(state);
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
        size: 30,
        color: Theme.of(context).colorScheme.homeNavigationBarSelectedIcon,
      ));
}

Widget mainSwitchFlashButton(BuildContext context, State state) {
  return IconButton(
      onPressed: () {
        switchFlash(state);
      },
      icon: Icon(
        flashMode == FlashMode.off ? Icons.flash_off : Icons.flash_on,
        size: 30,
        color: Theme.of(context).colorScheme.homeNavigationBarSelectedIcon,
      ));
}

Widget mainPictureButton(BuildContext context, State state) {
  return InkWell(
    onTap: () async {
      if (controller.value.isTakingPicture) return null;
      routeNavigation.routeImageViewer(
          context, await imageProcess(context, await takePicture(state)));
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

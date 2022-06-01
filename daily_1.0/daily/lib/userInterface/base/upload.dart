import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/themesLocal/colors.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();
  OverlayState overlayState;
  OverlayEntry overlayBackground;
  OverlayEntry overlayEntry;
  int _step = 0;
  double _height = 0, _width = 0;

  void _showOverlay(BuildContext context) async {
    overlayState = Overlay.of(context);

    overlayBackground = OverlayEntry(builder: (context) {
      return Center(
        child: GestureDetector(
          onTap: () {
            overlayEntry.mounted ? overlayEntry.remove() : null;
            overlayBackground.mounted ? overlayBackground.remove() : null;
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: new Color(0xCC000000),
          ),
        ),
      );
    });

    overlayEntry = OverlayEntry(builder: (context) {
      return Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          height: MediaQuery.of(context).size.height *
              0.7 *
              (_step == 0 ? 1 : _height),
          width: MediaQuery.of(context).size.height *
              0.7 *
              (_step == 0 ? 1 : _width),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.baseBackground),
          child: Center(child: _step == 0 ? step1() : step2()),
        ),
      );
    });

    overlayState.insert(overlayBackground);
    overlayState.insert(overlayEntry);
  }

  Widget _backButton() {
    return IconButton(
      onPressed: () {
        this.setState(() {
          _step--;
        });
      },
      icon: Icon(Icons.arrow_back),
      iconSize: 25,
      color: Colors.white,
    );
  }

  Widget step1() {
    return Material(
      color: Theme.of(context).colorScheme.baseBackground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
              await getImage();
              this.setState(() {
                _step++;
                overlayEntry.remove();
                overlayState.insert(overlayEntry);
              });
            },
            icon: Icon(Icons.image),
            iconSize: 45,
            color: Colors.white,
          ),
          AdaptiveText(
            "Upload Image",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Widget step2() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: image,
    );
  }

  Image image;

  void getImage() async {
    await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((value) async {
      //Have to do it like this for web, otherwise we can do "Image.File" will have that in cleanup
      //Need to get size
      image = Image.network(
        value.path,
      );
      _height = 0.5;
      _width = 0.3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.authWebGetStarted,
              borderRadius: BorderRadius.circular(10)),
          child: Material(
              color: Theme.of(context).colorScheme.materialTransparent,
              child: InkWell(
                  splashColor:
                      Theme.of(context).colorScheme.authWebGetStartedInkWell,
                  customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onTap: () {
                    _showOverlay(context);
                  },
                  child: Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(
                            Icons.upload,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            "Post",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  )))),
    );
  }
}

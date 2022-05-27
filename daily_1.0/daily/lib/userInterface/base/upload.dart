import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();
  OverlayState overlayState;
  OverlayEntry overlayBackground;
  OverlayEntry overlayBase;
  OverlayEntry overlayUploadStep1;
  OverlayEntry overlayUploadStep2;
  int _step = 0;

  void _showOverlay(BuildContext context) async {
    overlayState = Overlay.of(context);

    overlayBackground = OverlayEntry(builder: (context) {
      return Center(
        child: GestureDetector(
          onTap: () {
            overlayBackground.remove();
            overlayBase.remove();
            overlayUploadStep1.remove();
            overlayUploadStep2.remove();
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: new Color(0xCC000000),
          ),
        ),
      );
    });

    overlayBase = OverlayEntry(builder: (context) {
      return Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.baseBackground),
        ),
      );
    });

    overlayUploadStep1 = OverlayEntry(builder: (context) {
      return Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.baseBackground),
          child: Center(child: _step == 0 ? step1() : step2()),
        ),
      );
    });

    overlayUploadStep2 = OverlayEntry(builder: (context) {
      return Container();
    });

    overlayState.insert(overlayBackground);
    overlayState.insert(overlayBase);
    overlayState.insert(overlayUploadStep1);
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
              overlayUploadStep1.remove();
              overlayState.insert(overlayUploadStep2);
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
    return Container();
  }

  void getImage() async {
    await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((value) async {
      _firebaseAccounts.setCurrentUserProfilePicData(
          await value.readAsBytes(), this);
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

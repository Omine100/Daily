import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/themesLocal/colors.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  int _step = 0;

  void _showOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    OverlayEntry overlayBackground;

    overlayBackground = OverlayEntry(builder: (context) {
      return Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: new Color(0xCC000000),
        ),
      );
    });

    overlayEntry = OverlayEntry(builder: (context) {
      return Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.baseBackground),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  overlayBackground.remove();
                  overlayEntry.remove();
                },
                child: Tooltip(
                  waitDuration: Duration(seconds: 1),
                  message: "Close",
                  child: Icon(Icons.close,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.height * 0.025),
                ),
              ),
              Container(
                child: _uploadStep(),
              )
            ],
          ),
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
    );
  }

  Widget _forwardButton() {
    return IconButton(
      onPressed: () {
        this.setState(() {
          _step++;
        });
      },
    );
  }

  Widget _uploadStep() {
    switch (_step) {
      case 0:
        return Column(
          children: [],
        );
        break;
      case 1:
        return Column(
          children: [],
        );
        break;
      case 2:
        return Column(
          children: [],
        );
        break;
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Upload an image for the day",
      waitDuration: Duration(seconds: 1),
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
                    print("Test");
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

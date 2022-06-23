import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:daily/datastructures/post.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesBroad/firebasePost.dart';
import 'package:daily/servicesBroad/firebasePrompt.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/dimensions.dart';

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();
  FirebasePost _firebasePost = new FirebasePost();
  FirebasePrompt _firebasePrompt = new FirebasePrompt();
  OverlayState overlayState;
  OverlayEntry overlayBackground;
  OverlayEntry overlayEntry;
  int _step = 0;
  double _aspectRatio = 0;
  Post post;

  void _showOverlay(BuildContext context) async {
    overlayState = Overlay.of(context);

    overlayBackground = OverlayEntry(builder: (context) {
      return Center(
        child: GestureDetector(
          onTap: () {
            overlayEntry.mounted ? overlayEntry.remove() : null;
            overlayBackground.mounted ? overlayBackground.remove() : null;
            _step = 0;
            post = null;
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
              (_step == 0 ? 0.6 : _aspectRatio),
          width: MediaQuery.of(context).size.height *
              (_step == 0 ? 0.6 : _aspectRatio),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.background),
          child: _step == 0
              ? Center(
                  child: step1(),
                )
              : step2(),
        ),
      );
    });

    overlayState.insert(overlayBackground);
    overlayState.insert(overlayEntry);
  }

  Widget step1() {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
              await getImage();
              image.image.resolve(ImageConfiguration()).addListener(
                  ImageStreamListener((ImageInfo info, bool isSync) {
                setState(() {
                  _aspectRatio = info.image.height / info.image.width;
                  _step++;
                  overlayEntry.remove();
                  overlayState.insert(overlayEntry);
                });
              }));
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

  String _description = "";
  GlobalKey<FormFieldState> _forgotPasswordWebFormKey =
      GlobalKey<FormFieldState>();
  Widget step2() {
    return Column(
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(10), child: image),
        Material(
            color: Theme.of(context).colorScheme.background,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: getDimension(
                        context,
                        true,
                        Theme.of(context)
                            .visualDensity
                            .forgotPasswordWebUserInputFieldHeight),
                    width: getDimension(
                        context,
                        false,
                        Theme.of(context)
                            .visualDensity
                            .forgotPasswordWebUserInputFieldWidth),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      key: _forgotPasswordWebFormKey,
                      obscureText: false,
                      onChanged: (description) {
                        _description = description;
                      },
                      onSaved: (description) => {_description = description},
                      onFieldSubmitted: (value) {},
                      autofocus: false,
                      style: Theme.of(context).textTheme.labelMedium,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            getTranslated(context, "forgotPasswordFormEmail"),
                        labelStyle: Theme.of(context).textTheme.labelMedium,
                        hintStyle: Theme.of(context).textTheme.labelMedium,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    postCreation();
                  },
                ),
              ],
            )),
      ],
    );
  }

  Image image;
  Uint8List imageBytes;
  void getImage() async {
    await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((value) async {
      imageBytes = await value.readAsBytes();
      image = new Image(
        image: NetworkImage(value.path),
        fit: BoxFit.fill,
      );
    });
  }

  void postCreation() async {
    Post post = await Post(
        postId: _firebasePost.postIdGenerator(),
        uid: _firebaseAccounts.getCurrentUserId(),
        imageUrl: "",
        description: _description,
        prompt: await _firebasePrompt.getPrompt(context, DateTime.now()),
        timePosted: FieldValue.serverTimestamp(),
        likes: [],
        comments: []);
    _firebasePost.createUserPost(context, post, imageBytes);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _firebasePost.getHasUserPosted(
            context, _firebaseAccounts.getCurrentUserId()),
        builder: (context, hasPosted) {
          return Center(
              child: Container(
            height: 40,
            decoration: BoxDecoration(
                color: hasPosted.hasData
                    ? !(hasPosted.data as bool)
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.surfaceVariant
                    : Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(10)),
            child: Material(
              color: Colors.transparent,
              child: hasPosted.hasData
                  ? !(hasPosted.data as bool)
                      ? InkWell(
                          splashColor:
                              Theme.of(context).colorScheme.surfaceTint,
                          customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onTap: () {
                            _showOverlay(context);
                          },
                          child: postButtonContent())
                      : postButtonContent()
                  : postButtonContent(),
            ),
          ));
        });
  }

  Widget postButtonContent() {
    return Center(
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
              child:
                  Text("Post", style: Theme.of(context).textTheme.displaySmall))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/mediaManagement.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/fontProperties.dart';
import 'package:daily/themesLocal/sizes.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/userInterface/home.dart';

class UserIStandards {
  FirebaseAccounts firebaseAccounts = new FirebaseAccounts();
  MediaManagement mediaManagement = new MediaManagement();
  RouteNavigation routeNavigation = new RouteNavigation();

  Future<File> showMediaSelection(BuildContext context, State state) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(getTranslated(context, "mediaSelectionTitle")),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                          ),
                          Text(getTranslated(context, "mediaSelectionGallery")),
                        ],
                      ),
                      onTap: () async {
                        routeNavigation.routePop(context);
                        return await mediaManagement.imagePicker(
                            context, false, state);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_rounded,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                          ),
                          Text(
                            getTranslated(context, "mediaSelectionCamera"),
                          ),
                        ],
                      ),
                      onTap: () async {
                        routeNavigation.routePop(context);
                        return await mediaManagement.imagePicker(
                            context, true, state);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  Widget showShareButton(BuildContext context, String imageURL) {
    return new Material(
      color: Theme.of(context).colorScheme.materialTransparent,
      child: IconButton(
        onPressed: () {
          mediaManagement.shareImage(context, imageURL);
        },
        iconSize:
            Theme.of(context).materialTapTargetSize.userIStandardsShareButton,
        icon: Icon(
          Icons.share_outlined,
          color: Theme.of(context).colorScheme.userIStandardsShareButton,
        ),
      ),
    );
  }

  Widget showSocialButton(BuildContext context, int iconCase) {
    return new GestureDetector(
      onTap: () {
        routeNavigation.routePage(context, HomeScreen());
      },
      child: Container(
        padding: EdgeInsets.all(7.5),
        height:
            Theme.of(context).visualDensity.userIStandardsSocialButtonHeight,
        width: Theme.of(context).visualDensity.userIStandardsSocialButtonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(360),
          color: Theme.of(context).colorScheme.userIStandardsSocialButton,
        ),
        child: Image(image: AssetImage('lib/assets/googleLogo.png')),
      ),
    );
  }

  void showToastMessage(BuildContext context, String key) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        getTranslated(context, key),
        style: TextStyle(
            color:
                Theme.of(context).colorScheme.userIStandardsToastMessageContent,
            fontSize:
                Theme.of(context).textTheme.userIStandardsToastMessageContent,
            fontWeight:
                Theme.of(context).typography.userIStandardsToastMessageContent),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor:
          Theme.of(context).colorScheme.userIStandardsToastMessageBackground,
    ));
  }
}

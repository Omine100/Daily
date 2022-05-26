import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/standards/userXStandards.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();

Widget profileWebCard(BuildContext context, State state, bool isSmall) {
  return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Center(
            child: profileInfo(context),
          ),
          SizedBox(
            height: 15,
          ),
          profileContent(context, isSmall),
        ],
      ));
}

Widget profileInfo(BuildContext context) {
  return Center(
    child: Container(
        width: getDimension(context, false,
            Theme.of(context).visualDensity.baseWebProfileWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: getDimension(context, true,
                  Theme.of(context).visualDensity.baseWebProfileIconHeight),
              width: getDimension(context, true,
                  Theme.of(context).visualDensity.baseWebProfileIconWidth),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.baseWebProfileBackground,
              ),
              child: Container(),
            ).showClickOnHover,
            Container(
              padding: EdgeInsets.only(top: 15),
              width: getDimension(context, false,
                  Theme.of(context).visualDensity.baseWebProfileInfoWidth),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "@" + _firebaseAccounts.getCurrentUserDisplayName() ??
                            getTranslated(context, "settingsNullName"),
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.baseWebProfileName,
                          fontSize:
                              Theme.of(context).textTheme.baseWebProfileName,
                          fontWeight:
                              Theme.of(context).typography.baseWebProfileName,
                        ),
                      ),
                    ).showClickOnHover,
                  ),
                  Tooltip(
                    waitDuration: Duration(seconds: 1),
                    message: _firebaseAccounts.getCurrentUserEmail(),
                    child: Text(
                      _firebaseAccounts.getCurrentUserEmail() ??
                          getTranslated(context, "settingsNullEmail"),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.baseWebProfileEmail,
                        fontSize:
                            Theme.of(context).textTheme.baseWebProfileEmail,
                        fontWeight:
                            Theme.of(context).typography.baseWebProfileEmail,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
  );
}

Widget profileContent(BuildContext context, bool isSmall) {
  return Container();
}

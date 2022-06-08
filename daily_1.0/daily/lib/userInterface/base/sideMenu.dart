import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/servicesBroad/contact.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/standards/userIStandards.dart';
import 'package:daily/standards/userXStandards.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';
import 'package:daily/userInterface/base/baseWebComponents.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Widget _createHeader(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTabTapped(0);
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              "lib/assets/launcher/icon_noBackground.png",
              height: 50,
            ),
          ),
          Text(
            "Daily",
            style: TextStyle(
                color: Colors.grey, fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ).showClickOnHover;
  }

  Widget _createProfile(BuildContext context, State state) {
    return _firebaseAccounts.getSignedInStatus()
        ? Center(
            child: Container(
                width: getDimension(context, false,
                    Theme.of(context).visualDensity.baseWebProfileWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        upload();
                      },
                      child: Container(
                        height: getDimension(
                            context,
                            true,
                            Theme.of(context)
                                .visualDensity
                                .baseWebProfileIconHeight),
                        width: getDimension(
                            context,
                            true,
                            Theme.of(context)
                                .visualDensity
                                .baseWebProfileIconWidth),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context)
                              .colorScheme
                              .baseWebProfileBackground,
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              _firebaseAccounts.getCurrentUserProfilePic(),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) => showProgress(context),
                          errorWidget: (context, url, error) => Icon(
                            Icons.person_outline_rounded,
                            size: 55,
                            color: Theme.of(context)
                                .colorScheme
                                .baseWebProfileIcon,
                          ),
                        ),
                      ).showClickOnHover,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      width: getDimension(
                          context,
                          false,
                          Theme.of(context)
                              .visualDensity
                              .baseWebProfileInfoWidth),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: GestureDetector(
                              onTap: () {
                                onTabTapped(4);
                              },
                              child: Text(
                                "@" +
                                        _firebaseAccounts
                                            .getCurrentUserDisplayName() ??
                                    getTranslated(context, "settingsNullName"),
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .baseWebProfileName,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .baseWebProfileName,
                                  fontWeight: Theme.of(context)
                                      .typography
                                      .baseWebProfileName,
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
                                color: Theme.of(context)
                                    .colorScheme
                                    .baseWebProfileEmail,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .baseWebProfileEmail,
                                fontWeight: Theme.of(context)
                                    .typography
                                    .baseWebProfileEmail,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          )
        : Container();
  }

  Widget _createItem(
      {BuildContext context,
      IconData icon,
      String text,
      GestureTapCallback onTap}) {
    return InkWell(
      child: ListTile(
          onTap: onTap,
          title: Row(children: <Widget>[
            Icon(icon, color: Theme.of(context).colorScheme.baseWebDrawerItem),
            Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.baseWebDrawerItem,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ])),
    );
  }

  void upload() async {
    await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((value) async {
      _firebaseAccounts.setCurrentUserProfilePicData(
          await value.readAsBytes(), this);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? 5 : 0),
      color: Theme.of(context).colorScheme.baseWebDrawerBackground,
      child: SafeArea(
          child: Column(children: [
        _createHeader(context),
        SizedBox(
          height: 5,
        ),
        _createProfile(context, this),
        SizedBox(height: 15),
        _createItem(
            context: context,
            icon: Icons.home,
            text: 'Home',
            onTap: () => {onTabTapped(0)}),
        _createItem(
            context: context,
            icon: Icons.favorite,
            text: 'Favorites',
            onTap: () => {onTabTapped(1)}),
        _createItem(
            context: context,
            icon: Icons.settings,
            text: 'Settings',
            onTap: () => {onTabTapped(2)}),
        Expanded(child: Container()),
        Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 8,
              child: Divider(
                thickness: 2,
                color: Theme.of(context).colorScheme.baseWebCardContainer,
              ),
            ),
            _createItem(
                context: context,
                icon: Icons.help,
                text: 'Help',
                onTap: () => {
                      showDialogBox(
                          context,
                          getTranslated(context, "settingsHelpSupportBox"),
                          getContactEmail())
                    }),
            _createItem(
              context: context,
              icon: Icons.exit_to_app,
              text: 'Logout',
              onTap: () {
                _firebaseAccounts.signOut();
                context.router.replaceAll([AuthScreen()]);
              },
            )
          ],
        ),
      ])),
    );
  }
}

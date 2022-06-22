import 'package:daily/datastructures/user.dart' as userStructure;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/servicesBroad/contact.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/standards/userIStandards.dart';
import 'package:daily/standards/userXStandards.dart';
import 'package:daily/themesLocal/dimensions.dart';
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
    return Center(
      child: Container(
          width: getDimension(context, false,
              Theme.of(context).visualDensity.baseWebProfileWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createProfilePicture(context),
              _createProfileInfo(context),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: _createProfileReach(context),
              )
            ],
          )),
    );
  }

  Widget _createProfilePicture(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        upload();
      },
      child: Container(
        height: getDimension(context, true,
            Theme.of(context).visualDensity.baseWebProfileIconHeight),
        width: getDimension(context, true,
            Theme.of(context).visualDensity.baseWebProfileIconWidth),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        child: CachedNetworkImage(
          imageUrl: _firebaseAccounts.getCurrentUserProfilePic(),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => showProgress(context),
          errorWidget: (context, url, error) => Icon(
            Icons.person_outline_rounded,
            size: 55,
            color: customColors.icon,
          ),
        ),
      ).showClickOnHover,
    );
  }

  Widget _createProfileInfo(BuildContext context) {
    return Container(
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
              onTap: () {
                uid = _firebaseAccounts.getCurrentUserId();
                onTabTapped(4);
              },
              child: Text(
                "@" + _firebaseAccounts.getCurrentUserDisplayName() ??
                    getTranslated(context, "settingsNullName"),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline1,
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
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createProfileReach(BuildContext context) {
    return FutureBuilder(
        future: _firebaseAccounts
            .getUserInfoDoc(_firebaseAccounts.getCurrentUserId()),
        builder: (context, AsyncSnapshot<DocumentSnapshot> document) {
          userStructure.User user = document.hasData
              ? userStructure.User.fromSnap(document.data)
              : null;
          return document.hasData
              ? IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            user.followers.length.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Followers",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      const VerticalDivider(
                        width: 20,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      Column(
                        children: [
                          Text(
                            user.following.length.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Following",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                )
              : Container();
        });
  }

  Widget _createProfileReachContent(BuildContext context) {}

  Widget _createItem(
      {BuildContext context,
      IconData icon,
      String text,
      GestureTapCallback onTap}) {
    return InkWell(
      child: ListTile(
          onTap: onTap,
          title: Row(children: <Widget>[
            Icon(icon, color: customColors.icon),
            Padding(
                padding: EdgeInsets.only(left: 8.0),
                child:
                    Text(text, style: Theme.of(context).textTheme.headline1)),
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
      color: Theme.of(context).colorScheme.background,
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
                color: Theme.of(context).colorScheme.onBackground,
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

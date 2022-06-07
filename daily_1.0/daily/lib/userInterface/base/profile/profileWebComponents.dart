import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily/servicesBroad/firebasePost.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/userInterface/base/feedCard.dart';
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
FirebasePost _firebasePost = new FirebasePost();

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
          profileWebFeedTitle(context),
          SizedBox(
            height: 15,
          ),
          profileWebFeed(context, isSmall)
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

Widget profileWebFeedTitle(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: AdaptiveText(
      "Feed",
      style: TextStyle(
          color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );
}

Widget profileWebFeed(BuildContext context, bool isSmall) {
  int index = -1;

  return Expanded(
    child: Container(
      padding: EdgeInsets.only(bottom: 50),
      width: MediaQuery.of(context).size.width * (isSmall ? 0.7 : 0.9),
      child: new FutureBuilder(
        future: _firebasePost.readPosts(
            context, _firebaseAccounts.getCurrentUserId()),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> post) {
          if (!post.hasData) {
            return new Container();
          } else {
            index++;
            return ListView(
              children: post.data.docs.map((DocumentSnapshot document) {
                return Container(
                  height: 200,
                  width: 300,
                  child: TimelineTile(
                    alignment: TimelineAlign.manual,
                    axis: TimelineAxis.horizontal,
                    isFirst: index == 0,
                    lineXY: 0.5,
                    indicatorStyle: IndicatorStyle(
                      width: 30,
                      height: 30,
                      indicator: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.fromBorderSide(
                            BorderSide(
                              color: Colors.white.withOpacity(0.2),
                              width: 4,
                            ),
                          ),
                        ),
                      ),
                      drawGap: true,
                    ),
                    startChild: index % 2 == 0
                        ? FeedCard(
                            borderRadius: 10,
                            height: 200,
                            width: 300,
                            index: 1,
                          )
                        : Container(),
                    endChild: index % 2 != 0
                        ? FeedCard(
                            borderRadius: 10,
                            height: 200,
                            width: 300,
                            index: 1,
                          )
                        : Container(),
                    beforeLineStyle: LineStyle(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    ),
  );
}

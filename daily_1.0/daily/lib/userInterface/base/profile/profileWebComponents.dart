import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily/datastructures/post.dart';
import 'package:daily/servicesBroad/firebasePost.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/userInterface/base/feedCard.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily/datastructures/user.dart' as userStructure;
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/standards/userXStandards.dart';
import 'package:daily/themesLocal/dimensions.dart';

FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();
FirebasePost _firebasePost = new FirebasePost();
String _uid;

Widget profileWebCard(
    BuildContext context, State state, bool isSmall, String userId) {
  _uid = userId;
  return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          profileWebInfo(context, state),
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

Widget profileWebInfo(BuildContext context, State state) {
  return Card(
      elevation: 10,
      color: Colors.transparent,
      child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.background,
          ),
          child: FutureBuilder(
            future: _firebaseAccounts.getUserInfoDoc(_uid),
            builder: (context, AsyncSnapshot<DocumentSnapshot> document) {
              userStructure.User user = document.hasData
                  ? userStructure.User.fromSnap(document.data)
                  : null;
              return document.hasData
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        profileImage(context, user),
                        profileInfo(context, user),
                        _uid == _firebaseAccounts.getCurrentUserId()
                            ? Container()
                            : followButton(context, state)
                      ],
                    )
                  : Container();
            },
          )));
}

Widget profileInfo(BuildContext context, userStructure.User user) {
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
          child: Text(
            "@" + user.displayName ??
                getTranslated(context, "settingsNullName"),
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Theme.of(context).colorScheme.baseWebProfileName,
              fontSize: Theme.of(context).textTheme.baseWebProfileName,
              fontWeight: Theme.of(context).typography.baseWebProfileName,
            ),
          ),
        ),
        Text(
          user.email ?? getTranslated(context, "settingsNullEmail"),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Theme.of(context).colorScheme.baseWebProfileEmail,
            fontSize: Theme.of(context).textTheme.baseWebProfileEmail,
            fontWeight: Theme.of(context).typography.baseWebProfileEmail,
          ),
        ),
        Row(
          children: [
            Text(
              "Following ${user.following.length}" ??
                  getTranslated(context, "settingsNullEmail"),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).colorScheme.baseWebProfileEmail,
                fontSize: Theme.of(context).textTheme.baseWebProfileEmail,
                fontWeight: Theme.of(context).typography.baseWebProfileEmail,
              ),
            ),
            Text(
              "Followers ${user.followers.length}" ??
                  getTranslated(context, "settingsNullEmail"),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Theme.of(context).colorScheme.baseWebProfileEmail,
                fontSize: Theme.of(context).textTheme.baseWebProfileEmail,
                fontWeight: Theme.of(context).typography.baseWebProfileEmail,
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget profileImage(BuildContext context, userStructure.User user) {
  return Container(
    height: getDimension(context, true,
        Theme.of(context).visualDensity.baseWebProfileIconHeight),
    width: getDimension(
        context, true, Theme.of(context).visualDensity.baseWebProfileIconWidth),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Theme.of(context).colorScheme.baseWebProfileBackground,
    ),
    child: CachedNetworkImage(
      imageUrl: user.profilePicURL,
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
  );
}

Widget followButton(BuildContext context, State state) {
  return FutureBuilder(
      future: _firebaseAccounts.isFollowing(
          _firebaseAccounts.getCurrentUserId(), _uid),
      builder: (BuildContext context, AsyncSnapshot<bool> isFollowing) {
        return isFollowing.hasData
            ? Container(
                height: 40,
                width: 75,
                decoration: BoxDecoration(
                    color: !isFollowing.data ? Colors.red : Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  splashColor: isFollowing.data ? Colors.white : Colors.white,
                  customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onTap: () async {
                    await _firebaseAccounts.followUser(
                        _firebaseAccounts.getCurrentUserId(), _uid);
                    state.setState(() {});
                  },
                  child: Center(
                    child: Text(
                      isFollowing.data ? "Unfollow" : "Follow",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )
            : Container();
      });
}

Widget profileWebFeedTitle(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: AdaptiveText(
      "Timeline",
      style: TextStyle(
          color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );
}

Widget profileWebFeed(BuildContext context, bool isSmall) {
  return Expanded(
    child: Container(
        padding: EdgeInsets.only(bottom: 15),
        width: MediaQuery.of(context).size.width * (isSmall ? 0.7 : 0.9),
        child: StreamBuilder<QuerySnapshot>(
            stream: _firebasePost.readUserPosts(context, _uid),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return TimelineTile(
                          alignment: TimelineAlign.manual,
                          axis: TimelineAxis.horizontal,
                          isFirst: index == snapshot.data.docs.length - 1,
                          isLast: index == 0,
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
                          startChild: index % 2 != 0
                              ? FeedCard(
                                  post: Post.fromMap(
                                      snapshot.data.docs[index].data()),
                                  borderRadius: 10,
                                  height: 200,
                                  width: 300,
                                  index: 1,
                                )
                              : Container(),
                          endChild: index % 2 == 0
                              ? FeedCard(
                                  post: Post.fromMap(
                                      snapshot.data.docs[index].data()),
                                  borderRadius: 10,
                                  height: 200,
                                  width: 300,
                                  index: 1,
                                )
                              : Container(),
                          beforeLineStyle: LineStyle(
                            color: Colors.white.withOpacity(0.2),
                          ),
                        );
                      });
            })),
  );
}

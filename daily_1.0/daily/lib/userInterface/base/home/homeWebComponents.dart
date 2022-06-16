import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily/datastructures/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:daily/servicesBroad/firebasePost.dart';
import 'package:daily/servicesBroad/firebasePrompt.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/base/feedCard.dart';

FirebasePrompt _firebasePrompt = new FirebasePrompt();
FirebasePost _firebasePost = new FirebasePost();

Widget homeWebCard(BuildContext context, State state, bool isSmall) {
  return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          homeWebPromptTitle(context),
          SizedBox(
            height: 15,
          ),
          homeWebPrompt(context),
          SizedBox(
            height: 15,
          ),
          homeWebFeedTitle(context, state),
          SizedBox(
            height: 15,
          ),
          homeWebFeed(context, isSmall)
        ],
      ));
}

Widget homeWebPromptTitle(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: AdaptiveText(
      "Prompt",
      style: TextStyle(
          color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );
}

Widget homeWebPrompt(BuildContext context) {
  return FutureBuilder(
    future: _firebasePrompt.getPrompt(context, DateTime.now()),
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      return Card(
        elevation: 10,
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.baseBackground,
          ),
          child: Center(
              child: AdaptiveText(
            snapshot.hasData ? snapshot.data : "Prompt Unavailable....",
            style: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400),
          )),
        ),
      );
    },
  );
}

bool _isFollowing = false;
Widget homeWebFeedTitle(BuildContext context, State state) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        AdaptiveText(
          "Feed",
          style: TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            state.setState(() {
              _isFollowing = false;
            });
          },
          child: Text(
            "Global",
            style: TextStyle(
                color: _isFollowing ? Colors.grey : Colors.white,
                fontSize: 18,
                fontWeight: _isFollowing ? FontWeight.w400 : FontWeight.w600),
          ).showClickOnHover,
        ),
        SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: () {
            state.setState(() {
              _isFollowing = true;
            });
          },
          child: Text(
            "Following",
            style: TextStyle(
                color: _isFollowing ? Colors.white : Colors.grey,
                fontSize: 18,
                fontWeight: _isFollowing ? FontWeight.w600 : FontWeight.w400),
          ).showClickOnHover,
        ),
      ],
    ),
  );
}

Widget homeWebFeed(BuildContext context, bool isSmall) {
  return Container(
    //Need to add back in expanded
    height: 350,
    child: _isFollowing
        ? FutureBuilder(
            future: _firebasePost.readFollowingPosts(context),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? MasonryGridView.count(
                      crossAxisCount: isSmall ? 1 : 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return FeedCard(
                            post:
                                Post.fromMap(snapshot.data.docs[index].data()),
                            index: index,
                            height: isSmall ? 300 : (index % 4 + 2) * 100,
                            width: 100,
                            borderRadius: 10);
                      })
                  : Container();
            })
        : StreamBuilder<QuerySnapshot>(
            stream: _firebasePost.readPosts(context),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? MasonryGridView.count(
                      crossAxisCount: isSmall ? 1 : 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return FeedCard(
                            post:
                                Post.fromMap(snapshot.data.docs[index].data()),
                            index: index,
                            height: isSmall ? 300 : (index % 4 + 2) * 100,
                            width: 100,
                            borderRadius: 10);
                      })
                  : Container();
            }),
  );
}

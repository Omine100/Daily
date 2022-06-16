import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily/datastructures/user.dart' as dataStructure;
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesBroad/firebasePost.dart';
import 'package:daily/standards/userXStandards.dart';
import 'package:flutter/material.dart';
import 'package:daily/datastructures/post.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/base/baseWebComponents.dart';

class FeedCard extends StatefulWidget {
  final Post post;
  final int height;
  final int width;
  final int index;
  final double borderRadius;

  FeedCard(
      {Key key,
      @required this.post,
      @required this.height,
      @required this.width,
      @required this.index,
      @required this.borderRadius})
      : super(key: key);

  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();
  FirebasePost _firebasePost = new FirebasePost();

  void _showOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    OverlayEntry overlayBackground;

    overlayBackground = OverlayEntry(builder: (context) {
      return Center(
        child: GestureDetector(
          onTap: () {
            overlayEntry.remove();
            overlayBackground.remove();
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
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color: Theme.of(context).colorScheme.baseBackground),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  child: Image.network(
                    widget.post.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Material(
                    color: Theme.of(context).colorScheme.baseBackground,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder<DocumentSnapshot>(
                            stream: _firebaseAccounts
                                .getUserInfoDoc(widget.post.uid),
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? GestureDetector(
                                      onTap: () {
                                        uid = widget.post.uid;
                                        onTabTapped(4);
                                        overlayEntry.remove();
                                        overlayBackground.remove();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(360),
                                              child: Image.network(
                                                  (dataStructure.User.fromSnap(
                                                          snapshot.data)
                                                      .profilePicURL),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "@" +
                                                    (dataStructure.User
                                                            .fromSnap(
                                                                snapshot.data)
                                                        .displayName),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                              Container(
                                                width: 150,
                                                child: Text(
                                                  widget.post.description,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade300,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FontStyle.normal),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ))
                                  : Container(
                                      color: Colors.blue,
                                    );
                            },
                          )
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });

    overlayState.insert(overlayBackground);
    overlayState.insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showOverlay(context);
      },
      child: Card(
        elevation: 10,
        color: Colors.transparent,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: Image.network(widget.post.imageUrl)),
      ),
    ).showClickOnHover;
  }
}

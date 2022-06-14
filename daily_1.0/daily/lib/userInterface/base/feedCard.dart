import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily/servicesBroad/firebasePost.dart';
import 'package:daily/standards/userXStandards.dart';
import 'package:flutter/material.dart';
import 'package:daily/datastructures/post.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/themesLocal/colors.dart';

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
                  child: CachedNetworkImage(
                    imageUrl: widget.post.imageBytes,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                    placeholder: (context, url) => showProgress(context),
                    errorWidget: (context, url, error) =>
                        Container(color: Colors.blue),
                  ),
                ),
              ),
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
            child: Image.memory(
              _firebasePost.readImage(context, widget.post.imageBytes),
            )),
      ),
    ).showClickOnHover;
  }
}

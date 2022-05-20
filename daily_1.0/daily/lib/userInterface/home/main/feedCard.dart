import 'package:flutter/material.dart';

class FeedCard extends StatefulWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Function onTapped;

  FeedCard(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.borderRadius,
      @required this.onTapped})
      : super(key: key);

  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.transparent,
      child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            color: Colors.grey,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: Image(
                fit: BoxFit.fill,
                image: AssetImage(
                    "lib/assets/auth/web/auth_centerPiece_dark.jpg")),
          )),
    );
  }
}

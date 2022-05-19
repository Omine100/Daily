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
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: Colors.red,
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

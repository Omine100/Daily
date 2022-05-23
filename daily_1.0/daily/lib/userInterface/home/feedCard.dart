import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/hover.dart';
import 'package:daily/themesLocal/colors.dart';

class FeedCard extends StatefulWidget {
  final int height;
  final int width;
  final int index;
  final double borderRadius;

  FeedCard(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.index,
      @required this.borderRadius})
      : super(key: key);

  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  void _showOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    OverlayEntry overlayBackground;

    overlayBackground = OverlayEntry(builder: (context) {
      return Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: new Color(0x6F000000),
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
              color: Theme.of(context).colorScheme.homeBackground),
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
                    'https://picsum.photos/200/${widget.height}?random=${widget.index}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  overlayBackground.remove();
                  overlayEntry.remove();
                },
                child: Tooltip(
                  waitDuration: Duration(seconds: 1),
                  message: "Close",
                  child: Icon(Icons.close,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.height * 0.025),
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
          child: Image.network(
            'https://picsum.photos/200/${widget.height}?random=${widget.index}',
            width: widget.width.toDouble(),
            height: widget.height.toDouble(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ).showClickOnHover;
  }
}

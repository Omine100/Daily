import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily/datastructures/user.dart' as userStructure;
import 'package:daily/servicesBroad/firebaseAccounts.dart';

class SearchBar extends StatefulWidget {
  final double height;
  final double width;
  final double borderRadius;
  final Color background;
  final Color foreground;
  final double iconSize;
  final FontWeight fontWeight;
  final double fontSize;
  final String hint;

  SearchBar(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.borderRadius,
      @required this.background,
      @required this.foreground,
      @required this.iconSize,
      @required this.fontWeight,
      @required this.fontSize,
      @required this.hint})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  FirebaseAccounts _firebaseAccounts = new FirebaseAccounts();
  final LayerLink layerLink = LayerLink();
  GlobalKey _searchBarKey = new GlobalKey();
  String _searchText = "";
  OverlayEntry _overlayBackground;
  OverlayEntry _overlayEntry;

  void _setupOverlay(BuildContext context) {
    _overlayBackground = OverlayEntry(builder: (context) {
      return Center(
        child: GestureDetector(
          onTap: () {
            _overlayEntry.mounted ? _overlayEntry.remove() : null;
            _overlayBackground.mounted ? _overlayBackground.remove() : null;
            _overlayEntry = null;
            _overlayBackground = null;
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: new Color(0xCC000000),
          ),
        ),
      );
    });

    _overlayEntry = OverlayEntry(
        builder: (_) => Positioned(
              width: (context.findRenderObject() as RenderBox).size.width,
              child: CompositedTransformFollower(
                link: layerLink,
                offset: Offset(0.0,
                    (context.findRenderObject() as RenderBox).size.height - 10),
                child: Material(
                  color: Colors.grey,
                  child: FutureBuilder(
                      future: _firebaseAccounts.searchUsers(_searchText),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        List<userStructure.User> users = [];
                        snapshot.hasData
                            ? snapshot.data.docs.forEach((element) {
                                users.add(userStructure.User.fromSnap(element));
                              })
                            : null;
                        return snapshot.hasData
                            ? Container(
                                height: 100,
                                child: ListView(
                                  children: [
                                    for (var item in users)
                                      ListTile(
                                        title: Text(
                                          "Test ${item.displayName}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30),
                                        ),
                                        onTap: () {
                                          //Go to profile and dismiss
                                        },
                                      ),
                                    users.isEmpty
                                        ? ListTile(
                                            title: Text(
                                              "Empty",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 30),
                                            ),
                                            onTap: () {
                                              //Go to profile and dismiss
                                            },
                                          )
                                        : Container()
                                  ],
                                ),
                              )
                            : ListTile(
                                title: Text(
                                  "Empty",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                ),
                                onTap: () {
                                  //Go to profile and dismiss
                                },
                              );
                      }),
                ),
              ),
            ));

    Overlay.of(context).insert(_overlayBackground);
    Overlay.of(context).insert(_overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: widget.background,
        ),
        child: TextFormField(
          onChanged: (searchText) {
            _searchText = searchText;
            if (_overlayBackground == null) _setupOverlay(context);
          },
          onSaved: (searchText) => {_searchText = searchText},
          key: _searchBarKey,
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            labelStyle: TextStyle(
              color: widget.foreground,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
            ),
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: widget.foreground,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
            ),
            prefixIcon: Icon(
              Icons.search_outlined,
              size: widget.iconSize,
              color: widget.foreground,
            ),
          ),
        ),
      ),
    );
  }
}

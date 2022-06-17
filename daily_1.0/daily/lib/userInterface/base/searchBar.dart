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
  GlobalKey _searchBarKey = new GlobalKey();
  String _searchText = "";
  OverlayEntry _overlayEntry;

  void _setupOverlay(BuildContext context) {
    _overlayEntry = OverlayEntry(
        builder: (_) => Positioned(
              width: (context.findRenderObject() as RenderBox).size.width,
              child: Material(
                child: FutureBuilder(
                    future: _firebaseAccounts.searchUsers(_searchText),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                  ListTile(
                                    title: Text(
                                      "${users.length} - ${_searchText}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 30),
                                    ),
                                    onTap: () {
                                      //Go to profile and dismiss
                                    },
                                  ),
                                  for (var item in users)
                                    ListTile(
                                      title: Text(
                                        "Test ${item.displayName}",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 30),
                                      ),
                                      onTap: () {
                                        //Go to profile and dismiss
                                      },
                                    ),
                                  ListTile(
                                    title: Text(
                                      "Has data",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 30),
                                    ),
                                    onTap: () {
                                      //Go to profile and dismiss
                                    },
                                  )
                                ],
                              ),
                            )
                          : Container(
                              child: Text(
                                "No data",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 24),
                              ),
                            );
                    }),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        color: widget.background,
      ),
      child: TextFormField(
        onChanged: (searchText) {
          _searchText = searchText;
          _overlayEntry?.remove();
          _setupOverlay(context);
          Overlay.of(context).insert(_overlayEntry);
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
    );
  }
}

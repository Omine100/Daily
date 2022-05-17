import 'package:flutter/material.dart';

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
  final Function onChanged;

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
      @required this.hint,
      @required this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  GlobalKey _searchBarKey = new GlobalKey();

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
        onChanged: widget.onChanged,
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

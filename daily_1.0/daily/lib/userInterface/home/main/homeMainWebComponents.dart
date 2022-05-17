import 'package:flutter/material.dart';

Widget mainWebHeader(BuildContext context, State state, bool isSmall) {
  return Row(
    children: [
      isSmall ? _mainWebDrawer() : Container(),
      isSmall ? _mainWebTitle() : Container(),
      _mainWebSearchBar(),
      _mainWebNotifications(),
    ],
  );
}

Widget _mainWebDrawer() {
  return Container();
}

Widget _mainWebTitle() {
  return Container();
}

Widget _mainWebSearchBar() {
  return Container();
}

Widget _mainWebNotifications() {
  return IconButton(
    icon: Icon(
      Icons.notifications,
      color: Colors.grey,
    ),
    iconSize: 25,
    onPressed: () {},
  );
}

Widget mainWebPrompt(BuildContext context) {
  return Container();
}

Widget mainWebFeed() {
  return Container();
}

Widget _feedCard() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue,
    ),
  );
}

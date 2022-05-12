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

Widget _mainWebDrawer() {}

Widget _mainWebTitle() {}

Widget _mainWebSearchBar() {}

Widget _mainWebNotifications() {}

Widget mainWebPrompt(BuildContext context) {}

Widget mainWebFeed() {}

Widget _feedCard() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue,
    ),
  );
}

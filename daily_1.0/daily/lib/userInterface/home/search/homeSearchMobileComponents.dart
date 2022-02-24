import 'package:flutter/material.dart';
import 'package:daily/themesLocal/colors.dart';

Widget searchSearchBar(BuildContext context) {
  return Container(
    alignment: Alignment.centerLeft,
    width: MediaQuery.of(context).size.width * 0.85,
    height: MediaQuery.of(context).size.height * 0.051,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      color: Theme.of(context).colorScheme.homeMobileNavigationBarBackground,
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            Icons.search,
            color: Theme.of(context)
                .colorScheme
                .homeMobileNavigationBarUnselectedIcon,
            size: 30,
          ),
        ),
        Text(
          "Search",
          style: TextStyle(
              color: Theme.of(context)
                  .colorScheme
                  .homeMobileNavigationBarUnselectedIcon,
              fontSize: 20),
        ),
      ],
    ),
  );
}

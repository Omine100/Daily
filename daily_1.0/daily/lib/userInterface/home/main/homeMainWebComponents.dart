import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/userInterface/home/feedCard.dart';

Widget mainWebCard(BuildContext context, State state, bool isSmall) {
  return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          mainWebPromptTitle(context),
          SizedBox(
            height: 15,
          ),
          mainWebPrompt(context),
          SizedBox(
            height: 30,
          ),
          mainWebFeedTitle(context),
          SizedBox(
            height: 15,
          ),
          mainWebFeed(context, isSmall)
        ],
      ));
}

Widget mainWebPromptTitle(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: AdaptiveText(
      "Prompt",
      style: TextStyle(
          color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );
}

Widget mainWebPrompt(BuildContext context) {
  return Card(
    elevation: 10,
    color: Colors.transparent,
    child: Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.homeBackground,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: AdaptiveText(
          "Prompt #103: Something dark and scary.",
          style: TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400),
        )),
      ),
    ),
  );
}

Widget mainWebFeedTitle(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: AdaptiveText(
      "Feed",
      style: TextStyle(
          color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );
}

Widget mainWebFeed(BuildContext context, bool isSmall) {
  return Expanded(
    child: Container(
      width: MediaQuery.of(context).size.width * (isSmall ? 0.7 : 0.9),
      child: MasonryGridView.count(
        crossAxisCount: isSmall ? 1 : 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemBuilder: (context, index) {
          return FeedCard(
              index: index,
              height: isSmall ? 300 : (index % 4 + 2) * 100,
              width: 100,
              borderRadius: 10);
        },
      ),
    ),
  );
}

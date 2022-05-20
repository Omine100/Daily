import 'package:daily/servicesLocal/adaptive.dart';
import 'package:daily/userInterface/home/main/feedCard.dart';
import 'package:flutter/material.dart';
import 'package:daily/themesLocal/colors.dart';

Widget mainWebCard(BuildContext context, State state) {
  return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          mainWebPromptSection(context),
          SizedBox(
            height: 30,
          ),
          mainWebFeedSection(context)
        ],
      ));
}

Widget mainWebPromptSection(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AdaptiveText(
          "Prompt",
          style: TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
        mainWebPrompt(context)
      ],
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

Widget mainWebFeedSection(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AdaptiveText(
          "Feed",
          style: TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
        mainWebFeed()
      ],
    ),
  );
}

Widget mainWebFeed() {
  return Container(
    height: 539,
    child: GridView.count(
      crossAxisCount: 3,
      children: List.generate(
          100,
          (index) => Padding(
                padding: EdgeInsets.all(8),
                child: FeedCard(
                  borderRadius: 15,
                  height: 300,
                  width: 225,
                  onTapped: null,
                ),
              )),
    ),
  );
}

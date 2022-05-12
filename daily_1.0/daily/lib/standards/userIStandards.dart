import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily/servicesLocal/mediaPickerManagement.dart';
import 'package:daily/servicesLocal/routeManagement.gr.dart';
import 'package:daily/servicesLocal/systemManagement.dart';
import 'package:daily/themesLocal/colors.dart';
import 'package:daily/themesLocal/dimensions.dart';
import 'package:daily/themesLocal/fontSizes.dart';
import 'package:daily/themesLocal/fontWeights.dart';

MediaPickerManagement _mediaManagement = new MediaPickerManagement();

Future<Widget> showMediaSelection(
    BuildContext context, State state, Function saveFunction) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(
              getTranslated(context, "mediaSelectionTitle"),
              style: TextStyle(
                  color:
                      Theme.of(context).colorScheme.userIStandardsDialogText),
            ),
            backgroundColor:
                Theme.of(context).colorScheme.userIStandardsDialogBackground,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          color: Theme.of(context)
                              .colorScheme
                              .userIStandardsDialogIcon,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                        ),
                        Text(
                          getTranslated(context, "mediaSelectionGallery"),
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .userIStandardsDialogText),
                        ),
                      ],
                    ),
                    onTap: () async {
                      context.router.pop();
                      _mediaManagement.imagePicker(
                          context, false, state, saveFunction);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_rounded,
                          color: Theme.of(context)
                              .colorScheme
                              .userIStandardsDialogIcon,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                        ),
                        Text(
                          getTranslated(context, "mediaSelectionCamera"),
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .userIStandardsDialogText),
                        ),
                      ],
                    ),
                    onTap: () async {
                      context.router.pop();
                      return await _mediaManagement.imagePicker(
                          context, true, state, saveFunction);
                    },
                  )
                ],
              ),
            ));
      });
}

Widget showSocialButton(BuildContext context, int iconCase) {
  return new GestureDetector(
    onTap: () {
      context.router.push(HomeScreen());
    },
    child: Container(
      padding: EdgeInsets.all(7.5),
      height: Theme.of(context).visualDensity.userIStandardsSocialButtonHeight,
      width: Theme.of(context).visualDensity.userIStandardsSocialButtonWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(360),
        color: Theme.of(context).colorScheme.userIStandardsSocialButton,
      ),
      child: Image(image: AssetImage('lib/assets/googleLogo.png')),
    ),
  );
}

void showDialogBox(BuildContext context, String title, String content) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              Theme.of(context).colorScheme.settingsMobileBoxBackground,
          title: Text(title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.settingsMobileBoxText,
                fontSize: Theme.of(context).textTheme.settingsBoxTextTitle,
                fontWeight: Theme.of(context).typography.settingsBoxTextTitle,
              )),
          content: Text(content,
              style: TextStyle(
                color: Theme.of(context).colorScheme.settingsMobileBoxText,
                fontSize: Theme.of(context).textTheme.settingsBoxText,
                fontWeight: Theme.of(context).typography.settingsBoxText,
              )),
        );
      });
}

void showToastMessage(BuildContext context, String key, bool isError) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      getTranslated(context, key),
      style: TextStyle(
          color:
              Theme.of(context).colorScheme.userIStandardsToastMessageContent,
          fontSize:
              Theme.of(context).textTheme.userIStandardsToastMessageContent,
          fontWeight:
              Theme.of(context).typography.userIStandardsToastMessageContent),
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: isError
        ? Theme.of(context)
            .colorScheme
            .userIStandardsToastMessageBackgroundError
        : Theme.of(context).colorScheme.userIStandardsToastMessageBackground,
  ));
}

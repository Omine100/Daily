import 'package:flutter/material.dart';
import 'package:daily/servicesLocal/systemManagement.dart';

Future<Widget> showMediaSelection(
    BuildContext context, State state, Function saveFunction) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(
              getTranslated(context, "mediaSelectionTitle"),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                        ),
                        Text(
                          getTranslated(context, "mediaSelectionGallery"),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    onTap: () async {
                      // context.router.pop();
                      // _mediaManagement.imagePicker(
                      //     context, false, state, saveFunction);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt_rounded,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                        ),
                        Text(
                          getTranslated(context, "mediaSelectionCamera"),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    onTap: () async {
                      // context.router.pop();
                      // return await _mediaManagement.imagePicker(
                      //     context, true, state, saveFunction);
                    },
                  )
                ],
              ),
            ));
      });
}

void showDialogBox(BuildContext context, String title, String content) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
          content: Text(content, style: Theme.of(context).textTheme.bodyMedium),
        );
      });
}

void showToastMessage(BuildContext context, String key, bool isError) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      getTranslated(context, key),
      style: Theme.of(context).textTheme.bodyMedium,
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: isError
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.tertiary,
  ));
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserIStandards {
  //MECHANICS
  Widget showThemeSelector(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) => SwitchListTile(
        inactiveThumbImage: AssetImage(
            'lib/assets/interfaceStandardsThemeSelectorMoonImage.png'),
        activeThumbImage: AssetImage(
            'lib/assets/interfaceStandardsThemeSelectorSunImage.png'),
        activeColor:
            themes.getColor(context, "interfaceStandardsThemeSelectorColor"),
        inactiveThumbColor:
            themes.getColor(context, "interfaceStandardsThemeSelectorColor"),
        onChanged: (val) {
          notifier.toggleTheme();
        },
        value: notifier.darkTheme,
      ),
    );
  }

  Widget showLanguageSelector(BuildContext context) {

  }

  Future<void> showMediaSelectionDialog(BuildContext context, State state) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(getTranslated(context, "mediaSelectionTitle")),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                          ),
                          Text(getTranslated(context, "mediaSelectionGallery")),
                        ],
                      ),
                      onTap: () {
                        mediaManagement.getImage(context, false, state);
                        routeNavigation.routePop(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_rounded,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                          ),
                          Text(
                            getTranslated(context, "mediaSelectionCamera"),
                          ),
                        ],
                      ),
                      onTap: () {
                        mediaManagement.getImage(context, true, state);
                        routeNavigation.routePop(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }

  Widget showShareButton(BuildContext context, String imageURL) {
    return new Material(
      color: themes.getColor(context, "materialTransparentColor"),
      child: IconButton(
        onPressed: () {
          mediaManagement.saveAndShare(imageURL);
        },
        iconSize: themes.getDimension(
            context, true, "interfaceStandardsShareButtonIconDimension"),
        icon: Icon(
          Icons.share_outlined,
          color: themes.getColor(
              context, "interfaceStandardsShareButtonIconColor"),
        ),
      ),
    );
  }

  Widget showBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routeNavigation.routePop(context);
      },
      child: Icon(
        Icons.keyboard_backspace,
        color: themes.getColor(context, "interfaceStandardsBackButtonColor"),
        size: themes.getDimension(
            context, true, "interfaceStandardsBackButtonDimension"),
      ),
    );
  }

  Widget showSocialIconButton(BuildContext context, int iconCase) {
    //VARIABLE INITIALIZATION
    bool isNewUser;

    //USER INTERFACE: Show social icon button
    return new GestureDetector(
      onTap: () {
        iconCase == 0
            ? cloudFirestore.signInGoogle().then((_isNewUser) => isNewUser)
            : cloudFirestore.signInTwitter().then((_isNewUser) => isNewUser);
        if (isNewUser) {
          routeNavigation.routeHome(context);
        } else {
          routeNavigation.routeIntro(context);
        }
      },
      child: Container(
        padding: EdgeInsets.all(7.5),
        height: themes.getDimension(
            context, true, "welcomeSocialSignInButtonDimension"),
        width: themes.getDimension(
            context, true, "welcomeSocialSignInButtonDimension"),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(360),
          color: themes.getColor(context, "welcomeSocialSignInButtonColor"),
        ),
        child: Image(
          image: iconCase == 0
              ? AssetImage('lib/assets/googleLogo.png')
              : AssetImage('lib/assets/twitterLogo.png'),
        ),
      ),
    );
  }

  void showToastMessage(BuildContext context, String key) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        getTranslated(context, key),
        style: TextStyle(
            color: themes.getColor(
                context, "interfaceStandardsToastMessageContentColor"),
            fontSize: Theme.of(context)
                .textTheme
                .interfaceStandardsToastMessageContentFontSize,
            fontWeight: Theme.of(context)
                .typography
                .interfaceStandardsToastMessageContentFontWeight),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: themes.getColor(
          context, "interfaceStandardsToastMessageBackgroundColor"),
    ));
  }

  Widget showTitle(BuildContext context, String key) {
    return Text(
        getTranslated(context, key),
        style: TextStyle(
            color: themes.getColor(context, "interfaceStandardsTitleTextColor"),
            fontSize:
                Theme.of(context).textTheme.interfaceStandardsTitleFontSize,
            fontWeight:
                Theme.of(context).typography.interfaceStandardsTitleFontWeight),
      );
  }

  Widget showTextField(BuildContext context, int keyboardType, bool isVisible,
      String key, Function onSaved, IconButton iconButton) {
    return TextFormField(
      autofocus: false,
      keyboardType:
          keyboardType == 0 ? TextInputType.emailAddress : TextInputType.text,
      style: TextStyle(
        color: themes.getColor(context, "interfaceStandardsTextInputColor"),
        fontSize:
            Theme.of(context).textTheme.interfaceStandardsTextInputFontSize,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          key != "inputEmail"
              ? (key == "inputPassword" ? Icons.lock : Icons.person)
              : Icons.email,
          color:
              themes.getColor(context, "interfaceStandardsTextInputIconColor"),
        ),
        suffixIcon: iconButton != null ? iconButton : null,
        hintText: getTranslated(context, key),
        hintStyle: TextStyle(
          color: themes.getColor(context, "interfaceStandardsTextInputColor"),
        ),
        labelStyle: TextStyle(
          color: themes.getColor(context, "interfaceStandardsTextInputColor"),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: themes.getColor(
                context, "interfaceStandardsTextInputLineColor"),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: themes.getColor(context, "interfaceStandardsTextInputColor"),
          ),
        ),
      ),
      obscureText: !isVisible,
      maxLines: 1,
      validator: (value) => value.isEmpty
          ? ("$key " + getTranslated(context, "inputValidator"))
          : null,
      onSaved: onSaved,
    );
  }
}
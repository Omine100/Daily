import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daily/servicesBroad/firebaseAccounts.dart';
import 'package:daily/servicesLocal/mediaManagement.dart';
import 'package:daily/servicesLocal/routeNavigation.dart';
import 'package:daily/servicesLocal/systemLanguages.dart';
import 'package:daily/themesLocal/colors.dart';

class UserIStandards {
  //CLASS INITIALIZATION
  FirebaseAccounts firebaseAccounts = new FirebaseAccounts();
  MediaManagement mediaManagement = new MediaManagement();
  RouteNavigation routeNavigation = new RouteNavigation();

  //MECHANICS
  Widget showThemeSelector(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) => SwitchListTile(
        inactiveThumbImage: AssetImage(
            'lib/assets/interfaceStandardsThemeSelectorMoonImage.png'),
        activeThumbImage: AssetImage(
            'lib/assets/interfaceStandardsThemeSelectorSunImage.png'),
        activeColor:
            Theme.of(context).colorScheme.userIStandardsThemeSelector(),
        inactiveThumbColor:
            Theme.of(context).colorScheme.userIStandardsThemeSelector(),
        onChanged: (val) {
          notifier.toggleTheme();
        },
        value: notifier.darkTheme,
      ),
    );
  }

  Widget showLanguageSelector(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        dropdownColor:
            Theme.of(context).colorScheme.userIStandardsLanguageSelectorBackground(),
        onChanged: (Languages languages) {
          languages.setLanguage(context, languages);
        },
        icon: Icon(
          Icons.language,
          color: Theme.of(context).colorScheme.userIStandardsLanguageSelectorIcon(),
          size: themes.getDimension(context, true,
              "interfaceStandardsLanguageSelectorButtonDimension"),
        ),
        items: Languages.getLanguageList()
            .map<DropdownMenuItem<Languages>>((lang) => DropdownMenuItem(
                value: lang,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      lang.name,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.userIStandardsLanguageSelectorContent(),
                      ),
                    ),
                    Text(
                      lang.flag,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.userIStandardsLanguageSelectorContent()),
                    ),
                  ],
                )))
            .toList(),
      ),
    );
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
      color: Theme.of(context).colorScheme.materialTransparent(),
      child: IconButton(
        onPressed: () {
          mediaManagement.shareImage(imageURL);
        },
        iconSize: themes.getDimension(
            context, true, "interfaceStandardsShareButtonIconDimension"),
        icon: Icon(
          Icons.share_outlined,
          color: Theme.of(context).colorScheme.userIStandardsShareButton(),
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
        color: Theme.of(context).colorScheme.userIStandardsBackButton(),
        size: themes.getDimension(
            context, true, "interfaceStandardsBackButtonDimension"),
      ),
    );
  }

  Widget showSocialButton(BuildContext context, int iconCase) {
    //VARIABLE INITIALIZATION
    bool isNewUser;

    //USER INTERFACE: Show social icon button
    return new GestureDetector(
      onTap: () {
        iconCase == 0
            ? firebaseAccounts.signInGoogle().then((_isNewUser) => isNewUser)
            : firebaseAccounts.signInTwitter().then((_isNewUser) => isNewUser);
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
          color: Theme.of(context).colorScheme.userIStandardsSocialButton(),
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
            color: Theme.of(context).colorScheme.userIStandardsToastMessageContent(),
            fontSize: Theme.of(context)
                .textTheme
                .interfaceStandardsToastMessageContentFontSize,
            fontWeight: Theme.of(context)
                .typography
                .interfaceStandardsToastMessageContentFontWeight),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Theme.of(context).colorScheme.userIStandardsToastMessageBackground(),
    ));
  }

  Widget showTitle(BuildContext context, String key) {
    return Text(
      getTranslated(context, key),
      style: TextStyle(
          color: Theme.of(context).colorScheme.userIStandardsTitleContent(),
          fontSize: Theme.of(context).textTheme.interfaceStandardsTitleFontSize,
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
        color: Theme.of(context).colorScheme.userIStandardsTextInputContent(),
        fontSize:
            Theme.of(context).textTheme.interfaceStandardsTextInputFontSize,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          key != "inputEmail"
              ? (key == "inputPassword" ? Icons.lock : Icons.person)
              : Icons.email,
          color:
              Theme.of(context).colorScheme.userIStandardsTextInputIcon(),
        ),
        suffixIcon: iconButton != null ? iconButton : null,
        hintText: getTranslated(context, key),
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.userIStandardsTextInputContent(),
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.userIStandardsTextInputContent(),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.userIStandardsTextInputLine(),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.userIStandardsTextInputContent(),
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

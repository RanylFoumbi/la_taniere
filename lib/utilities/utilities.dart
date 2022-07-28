// ignore_for_file: constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:la_taniere/utilities/colors.dart';

class Utilities {
  static const String API_BASE_URL = "";

  static const String APP_NAME = "La tanière";

  static const String AD_MOB_ID = "";

  static const String AD_BANNER_UNIT_ID = "";

  static const String AD_REWARDED_UNIT_ID = "";

  static const String PLAY_STORE_APP_LINK =
      "https://play.google.com/store/apps/details?id=com.ranolf.riddles";

  static const String EMAIL_ADDRESS = "";

  static const String APP_PRIVACY_LINK = "";

  //final DialogService _dialogService = locator<DialogService>();

/*   Color setCategoryTextColor(String name) {
    switch (name) {
      case "Love":
        return BLUE_COLOR;
      case "Money":
        return ORANGE_COLOR;
      case "Brain":
        return GREEN_COLOR;
      case "Math":
        return BLUE_COLOR;
      case "Best":
        return ORANGE_COLOR;
      case "Funny":
        return GREEN_COLOR;
      case "Easy":
        return ORANGE_COLOR;
      case "Hard":
        return BLUE_COLOR;
      case "Animals":
        return GREEN_COLOR;
      case "Mangas":
        return ORANGE_COLOR;
      default:
        return BLUE_COLOR;
    }
  } */

/*   Color setCategoryBackColor(String name) {
    switch (name) {
      case "Love":
        return BLUE_DEGRADE_COLOR;
      case "Money":
        return ORANGE_DEGRADE_COLOR;
      case "Brain":
        return GREEN_DEGRADE_COLOR;
      case "Math":
        return BLUE_DEGRADE_COLOR;
      case "Best":
        return ORANGE_DEGRADE_COLOR;
      case "Funny":
        return GREEN_DEGRADE_COLOR;
      case "Easy":
        return ORANGE_DEGRADE_COLOR;
      case "Hard":
        return BLUE_DEGRADE_COLOR;
      case "Animals":
        return GREEN_DEGRADE_COLOR;
      case "Mangas":
        return ORANGE_DEGRADE_COLOR;
      default:
        return BLUE_DEGRADE_COLOR;
    }
  } */

  /* Future<void> internetDialog() async {
    await _dialogService.showDialog(
      title: 'Infos',
      description: 'Network error....',
      buttonTitle: 'OK',
      barrierDismissible: false,
      // dialogPlatform: DialogPlatform.Custom
    );
  }*/

  confirmDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const SingleChildScrollView(
            child: Text('Are you sure you want to exit?'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget headerBuilder(int activePageIndex) {
    switch (activePageIndex) {
      case 0:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Spacer(),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.search,
                color: WHITE_COLOR,
                size: 17,
              ),
              onPressed: () {},
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                FontAwesomeIcons.bell,
                color: WHITE_COLOR,
                semanticLabel: '2',
                size: 17,
              ),
            )
          ],
        );
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const AutoSizeText("Calendrier",
                style: TextStyle(
                  fontFamily: "Poppins-bold",
                  color: WHITE_COLOR,
                  fontSize: 22,
                )),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.calendar_today_outlined,
                color: WHITE_COLOR,
                size: 23,
              ),
              onPressed: () {},
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.bookmark_border,
                color: WHITE_COLOR,
                size: 27,
              ),
            )
          ],
        );
      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const AutoSizeText("Actualité",
                style: TextStyle(
                  fontFamily: "Poppins-bold",
                  color: WHITE_COLOR,
                  fontSize: 22,
                )),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.bookmark_border,
                color: WHITE_COLOR,
                size: 27,
              ),
            )
          ],
        );
      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Spacer(),
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.search,
                color: RED_COLOR,
                size: 15,
              ),
              onPressed: () {},
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                FontAwesomeIcons.bell,
                color: WHITE_COLOR,
                semanticLabel: '2',
                size: 15,
              ),
            )
          ],
        );
    }
  }
}

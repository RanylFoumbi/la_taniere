// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:la_taniere/models/article.dart';
import 'package:la_taniere/models/product.dart';
import 'package:la_taniere/models/product_category.dart';
import 'package:la_taniere/utilities/colors.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.router.dart';
import '../models/enum.dart';

class Utilities {
  static const String ROOT_BASE_URL = "https://joan500.pythonanywhere.com";

  static const String API_BASE_URL = "https://joan500.pythonanywhere.com/api";

  static const String APP_NAME = "La tanière";

  static const String AD_MOB_ID = "";

  static const String AD_BANNER_UNIT_ID = "";

  static const String AD_REWARDED_UNIT_ID = "";

  static const String PLAY_STORE_APP_LINK =
      "https://play.google.com/store/apps/details?id=com.la_taniere";

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

  Widget headerBuilder(PageHeader activePageHeader) {
    switch (activePageHeader) {
      case PageHeader.HOME:
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
      case PageHeader.MATCH:
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
      case PageHeader.ACTUALITY:
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
      case PageHeader.ARTICLE:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const AutoSizeText("Articles",
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
                size: 25,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: WHITE_COLOR,
                size: 23,
              ),
              onPressed: () {},
            ),
          ],
        );
      case PageHeader.PRODUCT_DETAIL:
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
                onPressed: () => NavigationService().back(),
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  size: 24,
                  color: WHITE_COLOR,
                )),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.share_outlined,
                color: WHITE_COLOR,
                size: 20,
              ),
            ),
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

  static List<Article> makeArticles(response) {
    final allArticles = jsonDecode(utf8.decode(response.bodyBytes));
    List<Article> articlesToDisplay = [];
    for (var article in allArticles["data"]) {
      print({"article": article});
      // Create an article
      Article newArticle = Article(
          name: article["name"] ?? '',
          link: article["link"],
          image: article["image"],
          title: article["title"] ?? '',
          source: article["source"] ?? '', // for post&Tweet
          author: article["author"] ?? '', // for article
          key_words: article["key_words"] ?? [], // for article
          updated_at: article["updated_at"],
          created_at: article["created_at"],
          description: article["description"]);

      articlesToDisplay.add(newArticle);
    }
    return articlesToDisplay;
  }

  static List<Product> makeProducts(response) {
    final allProducts = jsonDecode(utf8.decode(response.bodyBytes));
    // final allProducts = jsonDecode(response.body);
    List<Product> productsToDisplay = [];
    for (var product in allProducts["data"]) {
      // Create an product
      Product newProduct = Product(
          name: product["name"],
          price: product["price"].toDouble(),
          image: product["image"],
          status: product["status"],
          category: ProductCategory(
            label: product["category"]['libelle'],
            // image: product["category"]['image'],
            description: product["category"]['description'],
            created_at: product["category"]['created_at'],
            updated_at: product["category"]['updated_at'],
          ),
          reduction: product["reduction"].toDouble(),
          updated_at: product["updated_at"],
          created_at: product["created_at"],
          description: product["description"]);
      productsToDisplay.add(newProduct);
    }
    print({"productsToDisplay": "productsToDisplay"});
    return productsToDisplay;
  }

  static String getPriceAfterReduction(double currentPrice, double reduction) {
    double finalPrice = currentPrice - (currentPrice * (reduction / 100));
    return finalPrice.toStringAsFixed(0);
  }

  Widget isNewBadge() {
    return Container(
        height: 20,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: BACKGROUND_COLOR),
        alignment: Alignment.center,
        child: const AutoSizeText(
          "Nouveau",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: WHITE_COLOR,
              fontSize: 10,
              fontFamily: 'Poppins-light',
              overflow: TextOverflow.ellipsis),
        ));
  }

  Widget reductionBadge(double reduction) {
    return Container(
      height: 20,
      width: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: RED_COLOR),
      alignment: Alignment.center,
      child: Text(
        "${reduction.toStringAsFixed(0)}% OFF",
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: WHITE_COLOR,
            fontSize: 11,
            fontFamily: 'Poppins-light',
            overflow: TextOverflow.ellipsis),
      ),
    );
  }

  Widget getLikeViewShares(BuildContext context,
      {Color textColor = WHITE_COLOR}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Icon(
              Icons.remove_red_eye,
              color: textColor,
              size: 14,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '1,8k Vues',
              style: TextStyle(
                  color: textColor,
                  fontSize: 11,
                  fontFamily: 'Poppins-medium',
                  overflow: TextOverflow.ellipsis),
            ),
            const Padding(
              padding: EdgeInsets.all(6.0),
              child: Icon(
                FontAwesomeIcons.stop,
                color: WHITE_COLOR,
                size: 3,
              ),
            ),
            Icon(
              FontAwesomeIcons.solidHeart,
              color: textColor,
              size: 14,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '4,7k Likes',
              style: TextStyle(
                  color: textColor,
                  fontSize: 11,
                  fontFamily: 'Poppins-medium',
                  overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                FontAwesomeIcons.stop,
                color: textColor,
                size: 3,
              ),
            ),
            Icon(
              FontAwesomeIcons.shareFromSquare,
              color: textColor,
              size: 13,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '1,6k Partages',
              style: TextStyle(
                  color: textColor,
                  fontSize: 11,
                  fontFamily: 'Poppins-medium',
                  overflow: TextOverflow.ellipsis),
            ),
          ]),
    );
  }
}

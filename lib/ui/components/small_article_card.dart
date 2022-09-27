// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:la_taniere/utilities/colors.dart';

import '../../models/article.dart';

// ignore: must_be_immutable
class SmallArticleCard extends StatelessWidget {
  Article article;
  SmallArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {},
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: const BoxDecoration(
                color: GRAY_COLOR,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 130,
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.shield, size: 35, color: GRAY_DEGRADE_1_COLOR),
                  SizedBox(height: 5),
                  AutoSizeText(
                    "Shirt",
                    style: TextStyle(
                        color: GRAY_DEGRADE_1_COLOR,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins-medium',
                        overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

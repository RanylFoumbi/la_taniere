// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_taniere/models/article.dart';
import 'package:la_taniere/utilities/colors.dart';
import 'package:la_taniere/utilities/text.dart';
import 'package:la_taniere/utilities/utilities.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.router.dart';

// ignore: must_be_immutable
class PostCard extends StatelessWidget {
  bool isActuality;
  Article post;
  PostCard({Key? key, required this.isActuality, required this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationService navigationService = NavigationService();
    Size _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          navigationService.navigateTo(Routes.articleDetail,
              arguments: ArticleDetailArguments(article: post));
        },
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.35), BlendMode.overlay),
                        image:
                            NetworkImage(Utilities.ROOT_BASE_URL + post.image),
                        fit: BoxFit.cover)),
                width: _screenSize.width / 1.25,
                height: 160,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: _screenSize.width / 1.25,
                      height: 120,
                      padding: const EdgeInsets.only(
                          top: 14, left: 14.0, bottom: 4.0, right: 14.0),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            right: 0.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(
                                          8), // Border width
                                      decoration: const BoxDecoration(
                                          color: GRAY_DEGRADE_2_COLOR,
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.favorite,
                                        color: WHITE_COLOR,
                                        size: 13,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              width: _screenSize.width / 1.25,
              height: 100,
              decoration: const BoxDecoration(
                color: GRAY_COLOR,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    post.description,
                    style: titleText,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const Spacer(),
                  Expanded(
                    child:
                        Wrap(alignment: WrapAlignment.spaceAround, children: [
                      isActuality == true
                          ? const Text('')
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: SvgPicture.asset(
                                'assets/icons/youtube.svg',
                                color: RED_COLOR,
                                height: 13.0,
                                width: 13.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                      const SizedBox(
                        width: 5,
                      ),
                      isActuality == true
                          ? const AutoSizeText(
                              'Par Rodrigue Ntengue',
                              maxLines: 2,
                              style: TextStyle(
                                  color: GRAY_DEGRADE_2_COLOR,
                                  fontSize: 8.5,
                                  fontFamily: 'Poppins-light',
                                  overflow: TextOverflow.ellipsis),
                            )
                          : AutoSizeText(
                              post.source ?? '',
                              maxLines: 2,
                              style: const TextStyle(
                                  color: GRAY_DEGRADE_2_COLOR,
                                  fontSize: 8.5,
                                  fontFamily: 'Poppins-light',
                                  overflow: TextOverflow.ellipsis),
                            ),
                      const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.face,
                          color: GRAY_DEGRADE_2_COLOR,
                          size: 4,
                        ),
                      ),
                      isActuality == true
                          ? const AutoSizeText(
                              'article.created_at',
                              maxLines: 2,
                              style: TextStyle(
                                  color: GRAY_DEGRADE_2_COLOR,
                                  fontSize: 8.5,
                                  fontFamily: 'Poppins-light',
                                  overflow: TextOverflow.ellipsis),
                            )
                          : const AutoSizeText(
                              "il y'a 2 min",
                              maxLines: 2,
                              style: TextStyle(
                                  color: GRAY_DEGRADE_2_COLOR,
                                  fontSize: 8.5,
                                  fontFamily: 'Poppins-light',
                                  overflow: TextOverflow.ellipsis),
                            ),
                    ]),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:la_taniere/models/product.dart';

import '../../models/article.dart';
import '../../models/enum.dart';
import '../../utilities/colors.dart';
import '../../utilities/utilities.dart';

class ArticleDetail extends StatelessWidget {
  Article article; // dynamic type because it can be Article or Product
  ArticleDetail({Key? key, required this.article}) : super(key: key);
  List<String> images = <String>[
    "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
    "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    "https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
    "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    "https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"
  ];
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Container(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: Utilities().headerBuilder(PageHeader.PRODUCT_DETAIL)),
          backgroundColor: BACKGROUND_COLOR,
          actions: <Widget>[
            PopupMenuButton(onSelected: (result) async {
              if (result == 1) {}
            }, itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 0,
                  child: Text(
                    "A propos",
                    style: TextStyle(
                        color: BLACK_COLOR,
                        wordSpacing: 2,
                        fontSize: 13,
                        fontFamily: 'Poppins-medium',
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                const PopupMenuItem(
                  value: 1,
                  child: Text(
                    "Se déconnecter",
                    style: TextStyle(
                        color: BLACK_COLOR,
                        wordSpacing: 2,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins-medium',
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ];
            })
          ],
        ),
        backgroundColor: BACKGROUND_COLOR,
        body: Container(
            alignment: Alignment.topCenter,
            color: BACKGROUND_COLOR,
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollNotification) {
                // print('inside home the onNotification');
                return true;
              },
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  controller: ScrollController(),
                  children: [
                    SizedBox(
                      width: _screenSize.width,
                      child: Image.network(
                        Utilities.ROOT_BASE_URL + article.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              article.title ?? '',
                              style: const TextStyle(
                                  color: WHITE_COLOR,
                                  fontSize: 22,
                                  fontFamily: 'Poppins-bold',
                                  overflow: TextOverflow.ellipsis),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                            const SizedBox(height: 15),
                            ImageStack(
                              imageList: images,
                              imageRadius: 50,
                              imageCount: 3,
                              imageBorderWidth: 4,
                              totalCount: 8,
                              showTotalCount: true,
                              backgroundColor: BACKGROUND_COLOR,
                              imageBorderColor: BACKGROUND_COLOR,
                              extraCountBorderColor: GREEN_COLOR,
                              imageSource: ImageSource.Network,
                              extraCountTextStyle: const TextStyle(
                                  color: WHITE_COLOR,
                                  wordSpacing: 2,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins-medium',
                                  overflow: TextOverflow.ellipsis),
                            ),
                            const SizedBox(height: 15),
                            Utilities().getLikeViewShares(context,
                                textColor: GRAY_DEGRADE_2_COLOR),
                            const SizedBox(height: 30),
                            AutoSizeText(
                              article.description,
                              style: const TextStyle(
                                  color: WHITE_COLOR,
                                  fontSize: 14,
                                  fontFamily: 'Poppins-medium'),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 30),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CircleAvatar(
                                    backgroundColor: WHITE_COLOR,
                                    radius: 50,
                                    child: ClipOval(
                                        child: Image.network(
                                      "https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                                      width: 45,
                                      height: 45,
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Wrap(
                                    direction: Axis.vertical,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    children: const [
                                      Text(
                                        "Rédigé par :",
                                        softWrap: true,
                                        style: TextStyle(
                                          color: WHITE_COLOR,
                                          fontSize: 12,
                                          fontFamily: 'Poppins-medium',
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      AutoSizeText(
                                        "Rodrigue Ntengue",
                                        softWrap: true,
                                        style: TextStyle(
                                          color: YELLOW_COLOR,
                                          fontSize: 14,
                                          fontFamily: 'Poppins-bold',
                                        ),
                                      ),
                                    ]),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 40,
                              child: Flex(
                                mainAxisAlignment: MainAxisAlignment.start,
                                direction: Axis.horizontal,
                                children: const [
                                  AutoSizeText('Autres articles',
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontFamily: "Poppins-bold",
                                        color: WHITE_COLOR,
                                        fontSize: 18,
                                      )),
                                  Spacer(),
                                  IconButton(
                                      onPressed: null,
                                      // onPressed: () async => viewModel.navigationService
                                      //     .navigateTo(Routes.verticalListPage,
                                      //         arguments: VerticalListPageArguments(
                                      //             title: "Matchs à venir")),
                                      icon: Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 20,
                                          color: WHITE_COLOR)),
                                ],
                              ),
                            ),
                          ]),
                    )
                  ]),
            )));
  }
}

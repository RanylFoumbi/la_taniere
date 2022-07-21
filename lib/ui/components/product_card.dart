// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:la_taniere/utilities/colors.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.isNew}) : super(key: key);
  final bool isNew;

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
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                width: _screenSize.width / 1.25,
                height: _screenSize.height / 3.8,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: _screenSize.width / 1.25,
                      height: _screenSize.height / 3.8,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.25),
                                BlendMode.overlay),
                            image: const AssetImage("assets/images/shirt.png"),
                            /*image: new NetworkImage("https//."),*/
                            fit: BoxFit.cover),
                      ),
                      padding: const EdgeInsets.only(
                          top: 14, left: 14.0, bottom: 4.0, right: 14.0),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 0.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                isNew
                                    ? Container(
                                        height: 20,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: BACKGROUND_COLOR),
                                        alignment: Alignment.center,
                                        child: const AutoSizeText(
                                          "Nouveau",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: WHITE_COLOR,
                                              fontSize: 10,
                                              fontFamily: 'Poppins-light',
                                              overflow: TextOverflow.ellipsis),
                                        ))
                                    : Container(
                                        height: 20,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: RED_COLOR),
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "25% OFF",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: WHITE_COLOR,
                                              fontSize: 11,
                                              fontFamily: 'Poppins-light',
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
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
                                        Icons.bookmark_sharp,
                                        color: WHITE_COLOR,
                                        size: 12,
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
              decoration: const BoxDecoration(
                color: GRAY_COLOR,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    isNew ? "Accessoire" : "Shirt",
                    style: const TextStyle(
                        color: GRAY_DEGRADE_2_COLOR,
                        fontSize: 11,
                        fontFamily: 'Poppins-medium',
                        overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.left,
                  ),
                  const AutoSizeText(
                    "Maillot customisé",
                    style: TextStyle(
                        color: WHITE_COLOR,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins-medium',
                        overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                  Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        !isNew
                            ? const AutoSizeText(
                                '20.000 XAF' ' / ',
                                style: TextStyle(
                                    color: GRAY_DEGRADE_2_COLOR,
                                    wordSpacing: 2,
                                    fontSize: 13,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 2,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins-medium',
                                    overflow: TextOverflow.ellipsis),
                              )
                            : const Text(""),
                        AutoSizeText(
                          "15.000 XAF",
                          style: TextStyle(
                              color: isNew ? WHITE_COLOR : RED_COLOR,
                              fontSize: 13,
                              fontFamily: 'Poppins-medium',
                              overflow: TextOverflow.ellipsis),
                        ),
                      ]),
                ],
              ),
            )
          ],
        ));
  }
}

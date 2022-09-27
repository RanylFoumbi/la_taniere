// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:la_taniere/models/product.dart';
import 'package:la_taniere/utilities/colors.dart';
import 'package:la_taniere/utilities/utilities.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.router.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  Axis? axis;
  Product product;
  ProductCard({Key? key, this.axis, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationService navigationService = NavigationService();
    Size _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          navigationService.navigateTo(Routes.productDetail,
              arguments: ProductDetailArguments(product: product));
        },
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: axis == Axis.horizontal
                    ? const EdgeInsets.symmetric(horizontal: 10)
                    : const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                width: (axis == Axis.horizontal)
                    ? (_screenSize.width / 1.25)
                    : (_screenSize.width / 1.2),
                height: 150,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: (axis == Axis.horizontal)
                          ? (_screenSize.width / 1.25)
                          : (_screenSize.width / 1.2),
                      height: 150,
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
                                (product.reduction != 0 &&
                                            product.status == 'nouveau' ||
                                        product.reduction != 0 &&
                                            product.status != 'nouveau')
                                    ? Utilities()
                                        .reductionBadge(product.reduction)
                                    : product.status == 'nouveau'
                                        ? Utilities().isNewBadge()
                                        : const Text(""),
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
              width: (axis == Axis.horizontal)
                  ? (_screenSize.width / 1.25)
                  : (_screenSize.width / 1.2),
              decoration: const BoxDecoration(
                color: GRAY_COLOR,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    // isNew ? "Accessoire" : "Shirt",
                    product.name,
                    style: const TextStyle(
                        color: GRAY_DEGRADE_2_COLOR,
                        fontSize: 11,
                        fontFamily: 'Poppins-medium',
                        overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    // "Maillot customisé",
                    product.description,
                    style: const TextStyle(
                        color: WHITE_COLOR,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins-medium',
                        overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                  Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        product.reduction != 0
                            ? AutoSizeText(
                                "${product.price.toStringAsFixed(0)} XAF" ' / ',
                                style: const TextStyle(
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
                          "${Utilities.getPriceAfterReduction(product.price, product.reduction)} XAF",
                          style: TextStyle(
                              color: product.reduction == 0
                                  ? WHITE_COLOR
                                  : RED_COLOR,
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

// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../models/enum.dart';
import '../../models/product.dart';
import '../../utilities/colors.dart';
import '../../utilities/utilities.dart';

class ProductDetail extends StatelessWidget {
  Product product;
  ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                children: [],
              ),
            )));
  }
}

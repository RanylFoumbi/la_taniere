// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:la_taniere/ui/components/product_card.dart';

class ProductList extends StatelessWidget {
  List<String> products;
  ScrollController scrollController;
  ProductList(
      {Key? key, required this.products, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 10),
        controller: scrollController,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: null,
              child: ProductCard(
                isNew: index % 2 == 0 ? false : true,
              ));
        });
  }
}

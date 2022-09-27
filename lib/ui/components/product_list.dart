// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:la_taniere/models/product.dart';
import 'package:la_taniere/ui/components/product_card.dart';

class ProductList extends StatelessWidget {
  Axis axis;
  List<Product> products;
  ProductList({Key? key, required this.axis, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: axis,
        padding: axis == Axis.horizontal
            ? const EdgeInsets.only(left: 10)
            : const EdgeInsets.only(left: 0, bottom: 20),
        controller: ScrollController(),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: ProductCard(
            axis: axis,
            product: products[index],
          ));
        });
  }
}

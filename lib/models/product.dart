// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:la_taniere/models/product_category.dart';

class Product with ChangeNotifier {
  String name;
  String image;
  double price;
  String status;
  double reduction;
  String created_at;
  String updated_at;
  String description;
  ProductCategory category;

  Product(
      {required this.name,
      required this.image,
      required this.price,
      required this.status,
      required this.category,
      required this.reduction,
      required this.created_at,
      required this.updated_at,
      required this.description});
}

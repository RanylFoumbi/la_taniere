// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class ProductCategory with ChangeNotifier {
  String label;
  String? image;
  String created_at;
  String updated_at;
  String description;

  ProductCategory(
      {required this.label,
      this.image,
      required this.created_at,
      required this.updated_at,
      required this.description});
}

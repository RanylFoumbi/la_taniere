// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';


class Article with ChangeNotifier {
  String link;
  String? name;
  String image;
  String? title;
  String? author;
  String? source;
  String created_at;
  String updated_at;
  String description;
  List<String>? key_words;

  Article({
    this.title,
    this.author,
    this.source,
    this.key_words,
    required this.name,
    required this.link,
    required this.image,
    required this.created_at,
    required this.updated_at,
    required this.description,
  });
}

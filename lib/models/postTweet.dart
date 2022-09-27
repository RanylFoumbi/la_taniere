// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';

class PostTweet with ChangeNotifier {
  String title;
  String link;
  String image;
  String source;
  String created_at;
  String updated_at;
  String description;

  PostTweet({
    required this.link,
    required this.title,
    required this.image,
    required this.source,
    required this.created_at,
    required this.updated_at,
    required this.description,
  });
}

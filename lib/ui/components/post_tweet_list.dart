// ignore_for_file: deprecated_member_use, must_be_immutable, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:la_taniere/models/article.dart';

import 'post_card.dart';

class PostList extends StatelessWidget {
  Axis axis;
  List<Article> posts;
  PostList({Key? key, required this.axis, required this.posts})
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
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(
            isActuality: posts[index].source == null ? true : false,
            post: posts[index],
          );
        });
  }
}

// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';

import 'post_card.dart';

class PostList extends StatelessWidget {
  List<String> posts;
  ScrollController scrollController;
  PostList({Key? key, required this.posts, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 10),
        controller: scrollController,
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(onTap: null, child: const PostCard());
        });
  }
}

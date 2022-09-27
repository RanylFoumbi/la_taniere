// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:la_taniere/models/article.dart';
import 'package:la_taniere/ui/components/small_article_card.dart';

class SmallArticleList extends StatelessWidget {
  List<Article> articles;
  ScrollController scrollController;
  SmallArticleList(
      {Key? key, required this.articles, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 12),
        controller: scrollController,
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: null, child: SmallArticleCard(article: articles[index]));
        });
  }
}
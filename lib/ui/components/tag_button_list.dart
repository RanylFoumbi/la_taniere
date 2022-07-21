// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';

import '../../utilities/colors.dart';

class TagButtonList extends StatelessWidget {
  ScrollController scrollController;
  List<String> articles;
  TagButtonList(
      {Key? key, required this.scrollController, required this.articles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 17),
        controller: scrollController,
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: null,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              decoration: BoxDecoration(
                  color: GRAY_COLOR, borderRadius: BorderRadius.circular(10)),
              child: Text(articles[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 13,
                      color: WHITE_COLOR,
                      fontFamily: 'Poppins-medium')),
            ),
          );
        });
  }
}

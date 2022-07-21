// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:la_taniere/ui/components/match_card.dart';

class MatchList extends StatelessWidget {
  bool isScored;
  List<String> matches;
  ScrollController scrollController;
  MatchList(
      {Key? key,
      required this.isScored,
      required this.matches,
      required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 10),
        controller: scrollController,
        itemCount: matches.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: null, child: MatchCard(isScored: isScored));
        });
  }
}

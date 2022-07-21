// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:la_taniere/ui/screens/matchs/match_view.dart';

import '../../utilities/colors.dart';

class Calendar extends StatelessWidget {
  List<bool> selectedDate;
  ScrollController scrollController;
  Function setCalendarButtonState;
  Calendar(
      {Key? key,
      required this.selectedDate,
      required this.scrollController,
      required this.setCalendarButtonState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => setCalendarButtonState(index),
            child: Container(
              alignment: Alignment.center,
              width: 60,
              color: selectedDate[index] ? GRAY_DEGRADE_1_COLOR : GRAY_COLOR,
              child: Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AutoSizeText('20',
                      style: TextStyle(
                        fontFamily: "Poppins-bold",
                        color: WHITE_COLOR,
                        fontSize: 16,
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  AutoSizeText('01.22',
                      style: TextStyle(
                        fontFamily: "Poppins-medium",
                        color: GRAY_DEGRADE_2_COLOR,
                        fontSize: 8,
                      )),
                ],
              ),
            ),
          );
        });
  }
}

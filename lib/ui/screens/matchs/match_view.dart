// ignore_for_file: sized_box_for_whitespace, sort_child_properties_last

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:la_taniere/ui/components/post_tweet_list.dart';
import 'package:la_taniere/ui/components/product_list.dart';
import 'package:la_taniere/ui/components/tag_button_list.dart';
import 'package:la_taniere/ui/screens/matchs/match_viewmodel.dart';
import 'package:la_taniere/utilities/colors.dart';
import 'package:stacked/stacked.dart';

import '../../../utilities/utilities.dart';
import '../../components/calendar.dart';
import '../../components/match_card.dart';

class MatchView extends StatelessWidget {
  const MatchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return ViewModelBuilder<MatchViewModel>.reactive(
        viewModelBuilder: () => MatchViewModel(),
        onModelReady: (MatchViewModel viewModel) {
          for (var i = 0; i < 10; i++) {
            viewModel.selectedDate.add(false);
          }
          print({"selectedDate": viewModel.selectedDate});
        },
        onDispose: (MatchViewModel viewModel) {
          viewModel.listViewScrollController.dispose();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: PreferredSize(
              child: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Container(
                    padding: const EdgeInsetsDirectional.only(end: 8),
                    child: Utilities().headerBuilder(1)),
                backgroundColor: BACKGROUND_COLOR,
              ),
              preferredSize: viewModel.showHeader == true
                  ? const Size.fromHeight(50.0)
                  : const Size.fromHeight(00.0), // here the desired height
            ),
            backgroundColor: BACKGROUND_COLOR,
            body: Container(
              alignment: Alignment.topCenter,
              color: BACKGROUND_COLOR,
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollNotification) {
                  print('inside match the onNotification');
                  if (viewModel.listViewScrollController.position
                          .userScrollDirection ==
                      ScrollDirection.forward) {
                    print('match scrolled up');
                    viewModel.showHeader = true;
                  } else if (viewModel.listViewScrollController.position
                          .userScrollDirection ==
                      ScrollDirection.reverse) {
                    print('match scrolled down');
                    viewModel.showHeader = false;
                  }
                  return true;
                },
                child: ListView(
                  scrollDirection: Axis.vertical,
                  controller: viewModel.listViewScrollController,
                  shrinkWrap: true,
                  children: [
                    Container(
                        height: 70,
                        margin: const EdgeInsets.only(top: 15),
                        width: _screenSize.width,
                        child: Calendar(
                            scrollController:
                                viewModel.calendarScrollController,
                            selectedDate: viewModel.selectedDate,
                            setCalendarButtonState:
                                viewModel.setCalendarButtonState)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(top: 30),
                      height: 40,
                      child: const AutoSizeText('Coupe du monde',
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: "Poppins-bold",
                            color: WHITE_COLOR,
                            fontSize: 18,
                          )),
                    ),
                    Container(
                        height: 160,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                            onTap: null,
                            child: const MatchCard(isScored: false))),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(top: 30),
                      height: 40,
                      child: const AutoSizeText('1ère Division',
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: "Poppins-bold",
                            color: WHITE_COLOR,
                            fontSize: 18,
                          )),
                    ),
                    Container(
                        height: 160,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                            onTap: null,
                            child: const MatchCard(isScored: false))),
                    Container(
                        height: 160,
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                            onTap: null,
                            child: const MatchCard(isScored: false))),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

// ignore_for_file: sized_box_for_whitespace, sort_child_properties_last

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:la_taniere/ui/components/post_tweet_list.dart';
import 'package:la_taniere/ui/components/product_list.dart';
import 'package:la_taniere/ui/components/tag_button_list.dart';
import 'package:la_taniere/utilities/colors.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../../utilities/utilities.dart';
import '../../components/event_card.dart';
import '../../components/home_slider.dart';
import '../../components/match_list.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onDispose: (HomeViewModel viewModel) {
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
                    child: Utilities().headerBuilder(0)),
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
                  print('inside home the onNotification');
                  if (viewModel.listViewScrollController.position
                          .userScrollDirection ==
                      ScrollDirection.forward) {
                    print('home scrolled up');
                    viewModel.showHeader = true;
                  } else if (viewModel.listViewScrollController.position
                          .userScrollDirection ==
                      ScrollDirection.reverse) {
                    print('home scrolled down');
                    viewModel.showHeader = false;
                  }
                  return true;
                },
                child: ListView(
                  scrollDirection: Axis.vertical,
                  controller: viewModel.listViewScrollController,
                  shrinkWrap: true,
                  children: [
                    HomeSlider(screenSize: _screenSize, viewModel: viewModel),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 25),
                      height: 40,
                      child: TagButtonList(
                          scrollController:
                              viewModel.tagButtonListScroolController,
                          articles: viewModel.articles),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      margin: const EdgeInsets.only(bottom: 15),
                      height: 40,
                      child: Flex(
                        mainAxisAlignment: MainAxisAlignment.start,
                        direction: Axis.horizontal,
                        children: [
                          const AutoSizeText('Matchs à venir',
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: "Poppins-bold",
                                color: WHITE_COLOR,
                                fontSize: 18,
                              )),
                          const Spacer(),
                          IconButton(
                              onPressed: () async => viewModel.navigationService
                                  .navigateTo(Routes.verticalListPage,
                                      arguments: VerticalListPageArguments(
                                          title: "Matchs à venir")),
                              icon: const Icon(Icons.arrow_forward_ios_outlined,
                                  size: 20, color: WHITE_COLOR)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: MatchList(
                          isScored: false,
                          scrollController: viewModel.matchListScroolController,
                          matches: const ['1', '2', '3', '4']),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      height: 40,
                      child: Flex(
                        mainAxisAlignment: MainAxisAlignment.start,
                        direction: Axis.horizontal,
                        children: [
                          const AutoSizeText('Les scores',
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: "Poppins-bold",
                                color: WHITE_COLOR,
                                fontSize: 18,
                              )),
                          const Spacer(),
                          IconButton(
                              onPressed: () async => viewModel.navigationService
                                  .navigateTo(Routes.verticalListPage,
                                      arguments: VerticalListPageArguments(
                                          title: "Les scores")),
                              icon: const Icon(Icons.arrow_forward_ios_outlined,
                                  size: 20, color: WHITE_COLOR)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: MatchList(
                          isScored: true,
                          scrollController: viewModel.postListScroolController,
                          matches: const ['1', '2', '3', '4']),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      height: 40,
                      child: Flex(
                        mainAxisAlignment: MainAxisAlignment.start,
                        direction: Axis.horizontal,
                        children: [
                          const AutoSizeText('Evenements',
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: "Poppins-bold",
                                color: WHITE_COLOR,
                                fontSize: 18,
                              )),
                          const Spacer(),
                          IconButton(
                              onPressed: () async => viewModel.navigationService
                                  .navigateTo(Routes.verticalListPage,
                                      arguments: VerticalListPageArguments(
                                          title: "Evenements")),
                              icon: const Icon(Icons.arrow_forward_ios_outlined,
                                  size: 20, color: WHITE_COLOR)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: _screenSize.width / 1.5,
                      child: const EventCard(),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      height: 40,
                      child: Flex(
                        mainAxisAlignment: MainAxisAlignment.start,
                        direction: Axis.horizontal,
                        children: [
                          const AutoSizeText('Posts & Tweets',
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: "Poppins-bold",
                                color: WHITE_COLOR,
                                fontSize: 18,
                              )),
                          Spacer(),
                          IconButton(
                              onPressed: () async => viewModel.navigationService
                                  .navigateTo(Routes.verticalListPage,
                                      arguments: VerticalListPageArguments(
                                          title: "Posts & Tweets")),
                              icon: const Icon(Icons.arrow_forward_ios_outlined,
                                  size: 20, color: WHITE_COLOR)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 260,
                      child: PostList(
                          isActuality: false,
                          scrollController: viewModel.postListScroolController,
                          posts: const ['1', '2', '3', '4']),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      height: 40,
                      child: Flex(
                        mainAxisAlignment: MainAxisAlignment.start,
                        direction: Axis.horizontal,
                        children: [
                          const AutoSizeText('Produits',
                              maxLines: 2,
                              style: TextStyle(
                                fontFamily: "Poppins-bold",
                                color: WHITE_COLOR,
                                fontSize: 18,
                              )),
                          const Spacer(),
                          IconButton(
                              onPressed: () async => viewModel.navigationService
                                  .navigateTo(Routes.verticalListPage,
                                      arguments: VerticalListPageArguments(
                                          title: "Produits")),
                              icon: const Icon(Icons.arrow_forward_ios_outlined,
                                  size: 20, color: WHITE_COLOR)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _screenSize.height / 3.8 + 100,
                      child: ProductList(
                          scrollController:
                              viewModel.productListScroolController,
                          products: const ['1', '2', '3', '4']),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

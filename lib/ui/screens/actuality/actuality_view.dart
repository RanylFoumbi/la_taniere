// ignore_for_file: sized_box_for_whitespace, sort_child_properties_last

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:la_taniere/app/app.router.dart';
import 'package:la_taniere/ui/components/post_tweet_list.dart';
import 'package:la_taniere/utilities/colors.dart';
import 'package:stacked/stacked.dart';

import '../../../models/enum.dart';
import '../../../utilities/utilities.dart';
import '../../components/loader.dart';
import '../../components/no_data.dart';
import '../../components/on_error.dart';
import 'actuality_viewmodel.dart';

class ActualityView extends StatelessWidget {
  const ActualityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return ViewModelBuilder<ActualityViewModel>.reactive(
        viewModelBuilder: () => ActualityViewModel(),
        onModelReady: (ActualityViewModel viewModel) {},
        onDispose: (ActualityViewModel viewModel) {
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
                    child: Utilities().headerBuilder(PageHeader.ACTUALITY)),
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
                  print('inside actuality the onNotification');
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      height: 40,
                      child: Flex(
                        mainAxisAlignment: MainAxisAlignment.start,
                        direction: Axis.horizontal,
                        children: [
                          const AutoSizeText('Récents',
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
                                          title: "Récents")),
                              icon: const SizedBox(
                                child: Icon(Icons.arrow_forward_ios_outlined,
                                    size: 20, color: WHITE_COLOR),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 260,
                      child: viewModel.isBusy
                          ? const Loader()
                          : viewModel.hasError
                              ? const OnError()
                              : viewModel.postList.isEmpty
                                  ? const NoData()
                                  : PostList(
                                      posts: viewModel.postList,
                                      axis: Axis.horizontal,)
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      height: 40,
                      child: Flex(
                        mainAxisAlignment: MainAxisAlignment.start,
                        direction: Axis.horizontal,
                        children: [
                          const AutoSizeText('Tendances',
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
                                          title: "Tendances")),
                              icon: const Icon(Icons.arrow_forward_ios_outlined,
                                  size: 20, color: WHITE_COLOR)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 260,
                      child: PostList(
                          axis: Axis.horizontal, posts: viewModel.postList),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      height: 40,
                      child: Flex(
                        mainAxisAlignment: MainAxisAlignment.start,
                        direction: Axis.horizontal,
                        children: [
                          const AutoSizeText('Pour vous',
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
                                          title: "Pour vous")),
                              icon: const Icon(Icons.arrow_forward_ios_outlined,
                                  size: 20, color: WHITE_COLOR)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 260,
                      child: PostList(
                          axis: Axis.horizontal, posts: viewModel.postList),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

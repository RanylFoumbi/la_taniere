// ignore_for_file: must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:la_taniere/utilities/colors.dart';
import 'package:la_taniere/utilities/utilities.dart';
import 'package:stacked/stacked.dart';

import 'bigContainer_viewmodel.dart';

class BigContainerView extends StatelessWidget {
  const BigContainerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BigContainerViewModel>.reactive(
        viewModelBuilder: () => BigContainerViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
              // appBar: PreferredSize(
              //   child: AppBar(
              //     elevation: 0,
              //     automaticallyImplyLeading: false,
              //     title: Utilities().headerBuilder(viewModel.selectedIndex),
              //     backgroundColor: BACKGROUND_COLOR,
              //   ),
              //   preferredSize:
              //       const Size.fromHeight(50.0), // here the desired height
              // ),
              backgroundColor: BACKGROUND_COLOR,
              // extendBody: true,
              // extendBodyBehindAppBar: true,
              body: Stack(children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.only(bottom: 0),
                  child: PageView(
                    controller: viewModel.pageController,
                    onPageChanged: (index) => {viewModel.selectedIndex = index},
                    children: viewModel.tabList,
                    // allowImplicitScrolling: true,
                  ),
                ),
              ]),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: BACKGROUND_COLOR,
                showUnselectedLabels: true,
                showSelectedLabels: true,
                iconSize: 20,
                selectedItemColor: YELLOW_COLOR,
                unselectedItemColor: GRAY_DEGRADE_1_COLOR,
                selectedLabelStyle: const TextStyle(
                    fontFamily: "Poppins-light",
                    fontSize: 9,
                    height: 1.5,
                    color: YELLOW_COLOR),
                unselectedLabelStyle: const TextStyle(
                    fontFamily: "Poppins-light", fontSize: 9, height: 1.5),
                currentIndex: viewModel.selectedIndex,
                elevation: 0,
                onTap: (index) => {
                  viewModel.selectedIndex = index,
                  viewModel.pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn)
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    backgroundColor: BACKGROUND_COLOR,
                    icon: Icon(
                      Icons.home_outlined,
                      color: GRAY_DEGRADE_1_COLOR,
                    ),
                    label: "Accueil",
                    activeIcon: Icon(Icons.home_outlined, color: YELLOW_COLOR),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: BACKGROUND_COLOR,
                    icon: Icon(Icons.calendar_month_sharp,
                        color: GRAY_DEGRADE_1_COLOR),
                    label: "Matchs",
                    activeIcon:
                        Icon(Icons.calendar_month_sharp, color: YELLOW_COLOR),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: BACKGROUND_COLOR,
                    icon: Icon(Icons.library_books_outlined,
                        color: GRAY_DEGRADE_1_COLOR),
                    label: "Actualité",
                    activeIcon:
                        Icon(Icons.library_books_outlined, color: YELLOW_COLOR),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: BACKGROUND_COLOR,
                    icon: Icon(Icons.book, color: GRAY_DEGRADE_1_COLOR),
                    label: "Articles",
                    activeIcon: Icon(Icons.book, color: YELLOW_COLOR),
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: BACKGROUND_COLOR,
                    icon: Icon(Icons.account_circle_outlined,
                        color: GRAY_DEGRADE_1_COLOR),
                    label: "Profil",
                    activeIcon: Icon(Icons.account_circle_outlined,
                        color: YELLOW_COLOR),
                  )
                ],
              ));
        });
  }
}

// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:la_taniere/ui/screens/home/home_viewmodel.dart';
import 'package:la_taniere/utilities/utilities.dart';

import '../../utilities/colors.dart';

class HomeSlider extends StatelessWidget {
  Size screenSize;
  HomeViewModel viewModel;
  HomeSlider({Key? key, required this.screenSize, required this.viewModel})
      : super(key: key);

  List<Widget> _buildIndicators(images, currentPage) {
    print({"currentPage": currentPage});
    print({"view": viewModel.activePage});
    List<Widget> list = [];
    for (int i = 0; i < images.length; i++) {
      list.add(i == currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(3),
      width: 9.5,
      height: 9.5,
      decoration: BoxDecoration(
          color: isActive ? YELLOW_COLOR : GRAY_DEGRADE_2_COLOR,
          shape: BoxShape.circle),
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 350,
          child: PageView.builder(
              itemCount: viewModel.images.length,
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              controller: viewModel.pageController,
              onPageChanged: (page) {
                viewModel.activePage = page;
                print({"page": page});
              },
              itemBuilder: (context, pagePosition) {
                print({"pagePosition": pagePosition});
                return Image.asset(viewModel.images[pagePosition],
                    fit: BoxFit.cover);
              }),
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            height: 200,
            width: screenSize.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(1),
              ],
              begin: const Alignment(0, 2.4),
              end: const Alignment(0, -2.4),
              transform: const GradientRotation(30),
            )),
          ),
        ),
        Positioned(
            top: 180,
            left: 15.0,
            child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      color: GREEN_COLOR,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _buildIndicators(
                          viewModel.images, viewModel.activePage)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: screenSize.width / 1.3,
                  height: 100,
                  alignment: Alignment.centerLeft,
                  // padding: const EdgeInsets.only(right: 0),
                  child: const AutoSizeText(
                    "Les lions se qualifient pour la coupe du monde au Quatar",
                    maxLines: 3,
                    softWrap: true,
                    style: TextStyle(
                      color: WHITE_COLOR,
                      fontSize: 20,
                      fontFamily: 'Poppins-bold',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Utilities().getLikeViewShares(context)
              ],
            )),
      ],
    );
  }
}

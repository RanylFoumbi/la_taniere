// ignore_for_file: prefer_final_fields, avoid_unnecessary_containers

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:la_taniere/app/app.locator.dart';
import 'package:la_taniere/ui/screens/bigContainer/bigContainer_view.dart';
import 'package:la_taniere/ui/screens/home/home_view.dart';
import 'package:la_taniere/utilities/colors.dart';
import 'package:la_taniere/utilities/utilities.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'splash_screen_viewmodel.dart';

// ignore: must_be_immutable
class SplashScreenView extends StatelessWidget {
  SplashScreenView({Key? key}) : super(key: key);

  NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
        viewModelBuilder: () => SplashScreenViewModel(),
        builder: (context, viewModel, child) {
          stateControl(viewModel, context);
          return Scaffold(
              backgroundColor: GREEN_COLOR,
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                        child: Text(
                      Utilities.APP_NAME,
                      style: TextStyle(
                        color: WHITE_COLOR,
                        fontFamily: "Poppins-light",
                      ),
                    )),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        backgroundColor: GREEN_COLOR,
                        color: WHITE_COLOR,
                      ),
                    )
                  ],
                ),
              ));
        });
  }

  void stateControl(SplashScreenViewModel viewmodel, BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => {
              _navigationService.navigateWithTransition(
                  const BigContainerView(),
                  transitionStyle: Transition.zoom)
            });
    /* if (viewmodel.appVersion != "") {
      if (viewmodel.appVersion == AppVersion.CURRENT_VERSION) {
        Timer(Duration.zero,
            () => _navigationService.replaceWith(Routes.homeView));
      } else {
        Timer(Duration.zero, () {
          Utilities().updateAppDialog(context);
        });
      }
    }

    if (viewmodel.hasError) {
      Timer(
          Duration.zero, () => _navigationService.replaceWith(Routes.homeView));
    } */
  }
}

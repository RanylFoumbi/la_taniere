// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:la_taniere/utilities/colors.dart';

// ignore: must_be_immutable
class EventCard extends StatelessWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {},
        child: Container(
            margin: const EdgeInsets.only(left: 17, right: 27),
            width: _screenSize.width / 1.35,
            height: 370,
            decoration: const BoxDecoration(
              color: GRAY_COLOR,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: 0.0,
                  top: 00.0,
                  left: 00.0,
                  child: Container(
                    width: _screenSize.width / 1.35,
                    height: 220,
                    decoration: const BoxDecoration(
                      color: GRAY_COLOR,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.elliptical(150, 140),
                          bottomRight: Radius.elliptical(150, 75)),
                      image: DecorationImage(
                          image: AssetImage("assets/images/team.png"),
                          /*image: new NetworkImage("https//."),*/
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 00,
                  left: 00,
                  child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      width: _screenSize.width / 1.8,
                      alignment: Alignment.center,
                      height: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 20,
                          ),
                          AutoSizeText(
                            "Jusqu'au Quatar avec les lions",
                            style: TextStyle(
                                color: WHITE_COLOR,
                                fontSize: 25,
                                fontFamily: 'Poppins-bold',
                                overflow: TextOverflow.ellipsis),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          AutoSizeText(
                            "Achetez vos billets maintenant",
                            style: TextStyle(
                                color: GRAY_DEGRADE_2_COLOR,
                                fontSize: 12,
                                fontFamily: 'Poppins-medium',
                                overflow: TextOverflow.ellipsis),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                        ],
                      )),
                ),
                Positioned(
                  top: 200.0,
                  right: 00.0,
                  child: Container(
                    width: _screenSize.width / 3.5,
                    height: 180,
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(15), // Border width
                      decoration: const BoxDecoration(
                          color: GREEN_COLOR, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: YELLOW_COLOR,
                        size: 16,
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}

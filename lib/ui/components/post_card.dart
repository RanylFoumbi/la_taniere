// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_taniere/utilities/colors.dart';
import 'package:la_taniere/utilities/text.dart';

// ignore: must_be_immutable
class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {},
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.35), BlendMode.overlay),
                        image: const AssetImage("assets/images/lion_team.jpeg"),
                        /*image: new NetworkImage("https//."),*/
                        fit: BoxFit.cover)),
                width: _screenSize.width / 1.25,
                height: _screenSize.height / 3.8,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: _screenSize.width / 1.25,
                      height: _screenSize.height / 3.8,
                      padding: const EdgeInsets.only(
                          top: 14, left: 14.0, bottom: 4.0, right: 14.0),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            right: 0.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(
                                          8), // Border width
                                      decoration: const BoxDecoration(
                                          color: GRAY_DEGRADE_2_COLOR,
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.bookmark_sharp,
                                        color: WHITE_COLOR,
                                        size: 12,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              width: _screenSize.width / 1.25,
              height: 100,
              decoration: const BoxDecoration(
                color: GRAY_COLOR,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  const Flexible(
                      flex: 3,
                      child: Text(
                        "Quand les lions indomptables du cameroun ont dominé...",
                        style: titleText,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                      )),
                  const Spacer(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: SvgPicture.asset(
                            'assets/icons/youtube.svg',
                            color: RED_COLOR,
                            height: 13.0,
                            width: 13.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Youtube',
                          style: xsmallGray2,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.face,
                            color: GRAY_DEGRADE_2_COLOR,
                            size: 4,
                          ),
                        ),
                        const Text(
                          "il y'a 2 min",
                          style: xsmallGray2,
                        ),
                      ]),
                ],
              ),
            )
          ],
        ));
  }
}

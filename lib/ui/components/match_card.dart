import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:la_taniere/utilities/colors.dart';
import 'package:la_taniere/utilities/text.dart';

// ignore: must_be_immutable
class MatchCard extends StatelessWidget {
  const MatchCard({Key? key, required this.isScored}) : super(key: key);
  final bool isScored;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: screenSize.width / 1.2,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            color: GRAY_COLOR,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: SafeArea(
            child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.sports_soccer,
                  color: WHITE_COLOR,
                  size: 15,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Expanded(
                  child: AutoSizeText(
                    'Coupe du monde 2022',
                    maxLines: 1,
                    presetFontSizes: [12, 11, 10],
                    style: TextStyle(
                        color: WHITE_COLOR, overflow: TextOverflow.ellipsis),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8), // Border width
                  decoration: const BoxDecoration(
                      color: GRAY_DEGRADE_1_COLOR, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.bookmark_sharp,
                    color: GRAY_DEGRADE_2_COLOR,
                    size: 12,
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        'assets/images/cameroon.png',
                        height: 30.0,
                        width: 30.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      "Cameroon",
                      style: smallText,
                    )
                  ],
                ),
                /* const SizedBox(
                  width: 15,
                ), */

                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 5,
                    ),
                    isScored
                        ? const Text("1 : 0",
                            style: TextStyle(
                                color: WHITE_COLOR,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))
                        : const Text("VS",
                            style: TextStyle(
                                color: WHITE_COLOR,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                  ],
                ),
                /* const SizedBox(
                  width: 15,
                ), */
                Flex(
                  direction: Axis.vertical,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        'assets/images/brazil.jpeg',
                        height: 30.0,
                        width: 30.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      "Brazil",
                      style: smallText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 22),
                const Text(
                  "28.04.22 18:00",
                  style: TextStyle(color: GRAY_DEGRADE_2_COLOR, fontSize: 10),
                  textAlign: TextAlign.center,
                ),
                isScored == true ? const SizedBox(width: 3) : const SizedBox(),
                isScored == true
                    ? const Text(
                        "(1:0,0:0)",
                        style: TextStyle(
                            fontFamily: "Poppins-light",
                            color: GRAY_DEGRADE_2_COLOR,
                            fontSize: 10),
                        textAlign: TextAlign.center,
                      )
                    : const Text('')
              ],
            )
          ],
        )),
      ),
    );
  }
}

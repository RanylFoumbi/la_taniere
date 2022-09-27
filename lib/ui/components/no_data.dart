import 'package:flutter/material.dart';
import 'package:la_taniere/utilities/colors.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: BACKGROUND_COLOR,
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Center(
                child: Icon(
              Icons.search_sharp,
              color: WHITE_COLOR,
              size: 32,
            )),
            SizedBox(
              height: 15,
            ),
            Text(
              "Aucune données disponible pour l'instant",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  color: WHITE_COLOR,
                  fontFamily: "Poppins-light"),
            ),
          ],
        ));
  }
}

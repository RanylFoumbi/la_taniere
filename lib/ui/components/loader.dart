import 'package:flutter/material.dart';
import 'package:la_taniere/utilities/colors.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

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
                child: CircularProgressIndicator(
                    color: WHITE_COLOR, strokeWidth: 2)),
            SizedBox(
              height: 15,
            ),
            Text(
              "Chargement...",
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

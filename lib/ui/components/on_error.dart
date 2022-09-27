import 'package:flutter/material.dart';
import 'package:la_taniere/utilities/colors.dart';

class OnError extends StatelessWidget {
  const OnError({Key? key}) : super(key: key);

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
              Icons.error_outline_outlined,
              color: RED_COLOR,
              size: 30,
            )),
            SizedBox(
              height: 15,
            ),
            Text(
              "Une erreure est survenue, veuillez reessayerz!",
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

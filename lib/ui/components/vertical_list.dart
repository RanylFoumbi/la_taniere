// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../utilities/colors.dart';

class VerticalListPage extends StatefulWidget {
  String title;
  StatelessWidget? data;
  VerticalListPage({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  _VerticalListPageState createState() => _VerticalListPageState();
}

class _VerticalListPageState extends State<VerticalListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: AutoSizeText(widget.title,
              style: const TextStyle(
                fontFamily: "Poppins-bold",
                color: WHITE_COLOR,
                fontSize: 18,
              )),
          backgroundColor: BACKGROUND_COLOR,
        ),
        backgroundColor: BACKGROUND_COLOR,
        body: widget.data ??
            const Center(
              child: AutoSizeText(
                "Désolé données non disponibles",
                style: TextStyle(
                    color: WHITE_COLOR,
                    wordSpacing: 2,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins-medium',
                    overflow: TextOverflow.ellipsis),
              ),
            ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget AppBarTop() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: SvgPicture.asset(
      "images/back.svg",
      fit: BoxFit.scaleDown,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: SvgPicture.asset("images/menu.svg"),
      )
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget AppBarTop(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: InkWell(
      onTap: () {
        print("back");
        Navigator.pop(context);
      },
      child: SvgPicture.asset(
        "images/back.svg",
        fit: BoxFit.scaleDown,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: SvgPicture.asset("images/menu.svg"),
      )
    ],
  );
}

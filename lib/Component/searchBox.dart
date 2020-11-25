import 'package:flutter/material.dart';
import 'package:todo/Color/Colors.dart';
import 'package:todo/SizeConfig/SizeConfig.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: SkyBlueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: GetHeight(47),
        width: Getwidth(335),
        child: TextField(
          maxLines: 10,
          style: TextStyle(color: OrangeColor),
          decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              )),
        ));
  }
}
